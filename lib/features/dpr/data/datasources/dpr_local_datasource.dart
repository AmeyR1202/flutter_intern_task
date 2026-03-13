import 'package:flutter_intern_task/features/dpr/domain/entities/dpr_entities.dart';

class DprLocalDatasource {
  final List<DprEntity> _storage = [];

  Future<void> submitDpr(DprEntity dpr) async {
    await Future.delayed(Duration(milliseconds: 500));
    _storage.add(dpr);
  }
}
