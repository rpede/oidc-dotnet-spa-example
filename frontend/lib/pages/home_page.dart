import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../bloc/auth_cubit.dart';

class HomePage extends StatelessWidget {
  static final String path = "/";
  const new({super.key});

  void _onRolePressed(BuildContext context, String role) async {
    final response = await http.get(Uri.parse('/api/resource/$role'));
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).clearSnackBars();
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(response.body),
          backgroundColor: Colors.greenAccent,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Got statusCode ${response.statusCode}!"),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) => SingleChildScrollView(
          child: Column(
            children: [
              Text(state.name!, style: TextStyle(fontSize: 24)),
              for (final role in ['analyst', 'developer', 'pm'])
                OutlinedButton(
                  onPressed: () => _onRolePressed(context, role),
                  child: Text(role),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
