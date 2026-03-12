import 'package:flutter_intern_task/features/dpr/domain/entities/dpr_entities.dart';

abstract class DprRepository {
  Future<void> submitDpr(DprEntity dpr);
}
