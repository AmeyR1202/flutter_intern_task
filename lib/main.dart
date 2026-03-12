import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_intern_task/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:flutter_intern_task/features/auth/data/repository/auth_repository_impl.dart';
import 'package:flutter_intern_task/features/auth/domain/usecases/login_usecase.dart';
import 'package:flutter_intern_task/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_intern_task/features/auth/presentation/pages/login_page.dart';
import 'package:flutter_intern_task/features/project/data/datasources/project_local_datasources.dart';
import 'package:flutter_intern_task/features/project/data/repository/project_repository_impl.dart';
import 'package:flutter_intern_task/features/project/domain/usecases/get_project_usecase.dart';
import 'package:flutter_intern_task/features/project/presentation/bloc/project_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              AuthBloc(LoginUsecase(AuthRepositoryImpl(AuthLocalDatasource()))),
        ),

        BlocProvider(
          create: (_) => ProjectBloc(
            GetProjectUsecase(ProjectRepositoryImpl(ProjectLocalDatasources())),
          ),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      ),
    );
  }
}
