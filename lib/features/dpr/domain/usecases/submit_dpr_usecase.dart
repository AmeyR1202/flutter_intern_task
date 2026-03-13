import 'package:flutter_intern_task/core/errors/failure.dart';
import 'package:flutter_intern_task/features/dpr/domain/entities/dpr_entities.dart';
import 'package:flutter_intern_task/features/dpr/domain/repository/dpr_repository.dart';
import 'package:fpdart/fpdart.dart';

class SubmitDprUsecase {
  final DprRepository repository;

  SubmitDprUsecase(this.repository);

  Future<Either<Failure, void>> call(DprEntity dpr) {
    return repository.submitDpr(dpr);
  }
}
