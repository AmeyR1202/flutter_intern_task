import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_intern_task/features/dpr/domain/entities/dpr_entities.dart';
import 'package:flutter_intern_task/features/dpr/domain/usecases/submit_dpr_usecase.dart';
import 'package:flutter_intern_task/features/dpr/presentation/bloc/dpr_event.dart';
import 'package:flutter_intern_task/features/dpr/presentation/bloc/dpr_state.dart';

class DprBloc extends Bloc<DprEvent, DprState> {
  final SubmitDprUsecase submitDprUsecase;

  DprBloc(this.submitDprUsecase) : super(DprInitial()) {
    on<SubmitDpr>(_onSubmit);
  }

  Future<void> _onSubmit(SubmitDpr event, Emitter<DprState> emit) async {
    if (event.projectId == null) {
      emit(DprFailure("Please select a project"));
      return;
    }

    if (event.date == null) {
      emit(DprFailure("Please select a date"));
      return;
    }

    if (event.weather == null) {
      emit(DprFailure("Please select weather"));
      return;
    }

    if (event.description.trim().isEmpty) {
      emit(DprFailure("Enter work description"));
      return;
    }

    final workers = int.tryParse(event.workerCount);

    if (workers == null || workers <= 0) {
      emit(DprFailure("Enter valid worker count"));
      return;
    }

    if (event.images.isEmpty) {
      emit(DprFailure("Upload at least one photo"));
      return;
    }

    emit(DprSubmitting());

    try {
      final dpr = DprEntity(
        projectId: event.projectId!,
        date: event.date!,
        weather: event.weather!,
        description: event.description,
        workerCount: workers,
        images: event.images,
      );

      await submitDprUsecase(dpr);

      emit(DprSuccess());
    } catch (e) {
      emit(DprFailure("Failed to submit DPR"));
    }
  }
}
