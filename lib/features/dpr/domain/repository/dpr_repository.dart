import 'package:flutter_intern_task/core/errors/failure.dart';
import 'package:flutter_intern_task/features/dpr/domain/entities/dpr_entities.dart';
import 'package:fpdart/fpdart.dart';

abstract class DprRepository {
  Future<Either<Failure, void>> submitDpr(DprEntity dpr);
}
