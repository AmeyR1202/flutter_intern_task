import 'package:flutter_intern_task/core/errors/failure.dart';
import 'package:fpdart/fpdart.dart';

class AuthLocalDatasource {
  Future<Either<Failure, bool>> login(String email, String password) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));

      if (email == "test@test.com" && password == "123456") {
        return right(true);
      }
      return Left(Failure("Invalid email or password"));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
