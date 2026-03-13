import 'package:flutter_intern_task/core/errors/failure.dart';
import 'package:flutter_intern_task/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:flutter_intern_task/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_intern_task/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDatasource datasource;
  AuthRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, UserEntity>> login(
    String email,
    String password,
  ) async {
    try {
      final result = await datasource.login(email, password);

      return result.fold(
        (failure) => Left(failure),
        (success) => Right(UserEntity(email: email)),
      );
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
