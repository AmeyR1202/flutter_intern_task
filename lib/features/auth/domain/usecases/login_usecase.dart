import 'package:flutter_intern_task/core/errors/failure.dart';
import 'package:flutter_intern_task/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_intern_task/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class LoginUsecase {
  final AuthRepository authRepository;

  LoginUsecase(this.authRepository);

  Future<Either<Failure, UserEntity>> call(String email, String password) {
    return authRepository.login(email, password);
  }
}
