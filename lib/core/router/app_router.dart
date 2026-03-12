import 'package:flutter_intern_task/features/auth/presentation/pages/login_page.dart';
import 'package:flutter_intern_task/features/project/presentation/pages/project_list_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: "/login",
  routes: [
    GoRoute(path: "/login", builder: (context, state) => const LoginPage()),

    GoRoute(
      path: "/projects",
      builder: (context, state) => const ProjectListPage(),
    ),
  ],
);
