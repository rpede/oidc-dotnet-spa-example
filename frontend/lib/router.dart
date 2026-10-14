import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'bloc/auth_cubit.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';

final router = GoRouter(
  initialLocation: LoginPage.path,
  routes: [
    GoRoute(path: HomePage.path, builder: (context, state) => HomePage()),
    GoRoute(path: LoginPage.path, builder: (context, state) => LoginPage()),
  ],
  redirect: (context, GoRouterState state) {
    if (!context.read<AuthCubit>().state.isAuthenticated) {
      return LoginPage.path;
    } else {
      return null;
    }
  },
);
