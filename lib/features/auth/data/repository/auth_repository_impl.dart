import 'package:flutter_intern_task/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:flutter_intern_task/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_intern_task/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDatasource datasource;
  AuthRepositoryImpl(this.datasource);

  @override
  Future<UserEntity> login(String email, String password) async {
    final success = await datasource.login(email, password);

    if (success) {
      return UserEntity(email: email);
    } else {
      throw Exception("Invalid credentials");
    }
  }
}
