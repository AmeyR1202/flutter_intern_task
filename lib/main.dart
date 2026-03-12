import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_intern_task/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:flutter_intern_task/features/auth/data/repository/auth_repository_impl.dart';
import 'package:flutter_intern_task/features/auth/domain/usecases/login_usecase.dart';
import 'package:flutter_intern_task/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_intern_task/features/auth/presentation/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          AuthBloc(LoginUsecase(AuthRepositoryImpl(AuthLocalDatasource()))),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      ),
    );
  }
}
