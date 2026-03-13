import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_intern_task/features/project/domain/usecases/get_project_usecase.dart';
import 'package:flutter_intern_task/features/project/presentation/bloc/project_event.dart';
import 'package:flutter_intern_task/features/project/presentation/bloc/project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  final GetProjectUsecase getProjectUsecase;

  ProjectBloc(this.getProjectUsecase) : super(ProjectInitial()) {
    on<FetchProjects>(_onFetchProjects);
  }
  Future<void> _onFetchProjects(
    ProjectEvent event,
    Emitter<ProjectState> emit,
  ) async {
    emit(ProjectLoading());
    try {
      final projects = await getProjectUsecase();
      projects.fold(
        (failure) => emit(ProjectError(failure.message)),
        (projects) => emit(ProjectLoadedSuccessfully(projects)),
      );
    } catch (e) {
      emit(ProjectError("Unexpected error occurred"));
    }
  }
}
