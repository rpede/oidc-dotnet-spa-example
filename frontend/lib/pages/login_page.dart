import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/auth_cubit.dart';
import 'home_page.dart';

class LoginPage extends StatelessWidget {
  static final String path = "/login";
  const new({super.key});

  void _onLogin(BuildContext context) {
    context.read<AuthCubit>().login();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: BlocConsumer<AuthCubit, AuthState>(
        builder: (context, state) => switch (state.isAuthenticated) {
          false => Center(
            child: FilledButton(
              onPressed: () => _onLogin(context),
              child: Text("Login"),
            ),
          ),
          true => Placeholder(),
        },
        listener: (context, state) {
          if (state.isAuthenticated) context.go(HomePage.path);
        },
      ),
    );
  }
}
