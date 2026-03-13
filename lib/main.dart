import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_intern_task/core/di/service_locator.dart';
import 'package:flutter_intern_task/core/router/app_router.dart';
import 'package:flutter_intern_task/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_intern_task/features/dpr/presentation/bloc/dpr_bloc.dart';
import 'package:flutter_intern_task/features/project/presentation/bloc/project_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<AuthBloc>()),
        BlocProvider(create: (_) => sl<ProjectBloc>()),
        BlocProvider(create: (_) => sl<DprBloc>()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter,
      ),
    );
  }
}
