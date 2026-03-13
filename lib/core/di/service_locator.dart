import 'package:flutter_intern_task/features/project/domain/repositories/project_repository.dart';
import 'package:get_it/get_it.dart';
import '../../features/auth/data/datasources/auth_local_datasource.dart';
import '../../features/auth/data/repository/auth_repository_impl.dart';
import '../../features/auth/domain/repository/auth_repository.dart';
import '../../features/auth/domain/usecases/login_usecase.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../features/project/data/datasources/project_local_datasources.dart';
import '../../features/project/data/repository/project_repository_impl.dart';
import '../../features/project/domain/usecases/get_project_usecase.dart';
import '../../features/project/presentation/bloc/project_bloc.dart';
import '../../features/dpr/data/datasources/dpr_local_datasource.dart';
import '../../features/dpr/data/repository/dpr_repository_impl.dart';
import '../../features/dpr/domain/repository/dpr_repository.dart';
import '../../features/dpr/domain/usecases/submit_dpr_usecase.dart';
import '../../features/dpr/presentation/bloc/dpr_bloc.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  /// AUTH DI SETUP ONLY

  sl.registerLazySingleton<AuthLocalDatasource>(() => AuthLocalDatasource());

  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

  sl.registerLazySingleton<LoginUsecase>(() => LoginUsecase(sl()));

  sl.registerFactory<AuthBloc>(() => AuthBloc(sl()));

  /// PROJECT DI SETUP ONLY

  sl.registerLazySingleton<ProjectLocalDatasources>(
    () => ProjectLocalDatasources(),
  );

  sl.registerLazySingleton<ProjectRepository>(
    () => ProjectRepositoryImpl(sl()),
  );

  sl.registerLazySingleton<GetProjectUsecase>(() => GetProjectUsecase(sl()));

  sl.registerFactory<ProjectBloc>(() => ProjectBloc(sl()));

  /// DPR DI SETUP ONLY

  sl.registerLazySingleton<DprLocalDatasource>(() => DprLocalDatasource());

  sl.registerLazySingleton<DprRepository>(() => DprRepositoryImpl(sl()));

  sl.registerLazySingleton<SubmitDprUsecase>(() => SubmitDprUsecase(sl()));

  sl.registerFactory<DprBloc>(() => DprBloc(sl()));
}
