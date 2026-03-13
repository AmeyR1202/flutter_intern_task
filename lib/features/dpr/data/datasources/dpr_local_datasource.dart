import 'package:flutter_intern_task/core/errors/failure.dart';
import 'package:flutter_intern_task/features/dpr/domain/entities/dpr_entities.dart';
import 'package:fpdart/fpdart.dart';

class DprLocalDatasource {
  final List<DprEntity> _storage = [];

  Future<Either<Failure, void>> submitDpr(DprEntity dpr) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));

      _storage.add(dpr);

      return const Right(null);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
