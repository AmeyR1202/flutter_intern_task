import 'package:flutter_intern_task/features/dpr/domain/entities/dpr_entities.dart';
import 'package:flutter_intern_task/features/dpr/domain/repository/dpr_repository.dart';

class SubmitDprUsecase {
  final DprRepository repository;

  SubmitDprUsecase(this.repository);

  Future<void> call(DprEntity dpr) {
    return repository.submitDpr(dpr);
  }
}
