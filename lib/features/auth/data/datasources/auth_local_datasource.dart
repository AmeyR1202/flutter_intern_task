class AuthLocalDatasource {
  Future<bool> login(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));

    if (email == "test@test.com" && password == "123456") {
      return true;
    }
    return false;
  }
}
