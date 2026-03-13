import 'package:flutter_intern_task/features/dpr/data/datasources/dpr_local_datasource.dart';
import 'package:flutter_intern_task/features/dpr/domain/entities/dpr_entities.dart';
import 'package:flutter_intern_task/features/dpr/domain/repository/dpr_repository.dart';

class DprRepositoryImpl implements DprRepository {
  final DprLocalDatasource datasource;

  DprRepositoryImpl(this.datasource);

  @override
  Future<void> submitDpr(DprEntity dpr) {
    return datasource.submitDpr(dpr);
  }
}
