import 'package:flutter_intern_task/core/errors/failure.dart';
import 'package:flutter_intern_task/features/dpr/data/datasources/dpr_local_datasource.dart';
import 'package:flutter_intern_task/features/dpr/domain/entities/dpr_entities.dart';
import 'package:flutter_intern_task/features/dpr/domain/repository/dpr_repository.dart';
import 'package:fpdart/fpdart.dart';

class DprRepositoryImpl implements DprRepository {
  final DprLocalDatasource datasource;

  DprRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, void>> submitDpr(DprEntity dpr) async {
    try {
      final result = await datasource.submitDpr(dpr);

      return result;
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
