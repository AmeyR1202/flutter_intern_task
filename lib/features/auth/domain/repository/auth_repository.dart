import 'package:flutter_intern_task/core/errors/failure.dart';
import 'package:flutter_intern_task/features/auth/domain/entities/user_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> login(String email, String password);
}
