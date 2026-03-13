import 'package:flutter_intern_task/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:flutter_intern_task/features/auth/data/repository/auth_repository_impl.dart';
import 'package:flutter_intern_task/features/auth/domain/usecases/login_usecase.dart';
import 'package:flutter_intern_task/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_intern_task/features/dpr/data/datasources/dpr_local_datasource.dart';
import 'package:flutter_intern_task/features/dpr/data/repository/dpr_repository_impl.dart';
import 'package:flutter_intern_task/features/dpr/domain/usecases/submit_dpr_usecase.dart';
import 'package:flutter_intern_task/features/dpr/presentation/bloc/dpr_bloc.dart';
import 'package:flutter_intern_task/features/project/data/datasources/project_local_datasources.dart';
import 'package:flutter_intern_task/features/project/data/repository/project_repository_impl.dart';
import 'package:flutter_intern_task/features/project/domain/usecases/get_project_usecase.dart';
import 'package:flutter_intern_task/features/project/presentation/bloc/project_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // following are the sl for only auth
  sl.registerLazySingleton<AuthLocalDatasource>(() => AuthLocalDatasource());

  sl.registerLazySingleton<AuthRepositoryImpl>(() => AuthRepositoryImpl(sl()));

  sl.registerLazySingleton<LoginUsecase>(() => LoginUsecase(sl()));

  sl.registerFactory<AuthBloc>(() => AuthBloc(sl()));

  // following are the sl for only project feature

  sl.registerLazySingleton<ProjectLocalDatasources>(
    () => ProjectLocalDatasources(),
  );

  sl.registerLazySingleton<ProjectRepositoryImpl>(
    () => ProjectRepositoryImpl(sl()),
  );

  sl.registerLazySingleton<GetProjectUsecase>(() => GetProjectUsecase(sl()));

  sl.registerFactory<ProjectBloc>(() => ProjectBloc(sl()));

  // following are the sl for only dpr feature

  sl.registerLazySingleton<DprLocalDatasource>(() => DprLocalDatasource());

  sl.registerLazySingleton<DprRepositoryImpl>(() => DprRepositoryImpl(sl()));

  sl.registerLazySingleton<SubmitDprUsecase>(() => SubmitDprUsecase(sl()));

  sl.registerFactory<DprBloc>(() => DprBloc(sl()));
}
