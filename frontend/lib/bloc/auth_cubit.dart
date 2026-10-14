import 'package:flutter_bloc/flutter_bloc.dart';

import '../api/api_service.dart';

final class AuthState {
  bool isAuthenticated;
  String? name;

  AuthState({required this.isAuthenticated, this.name});
}

class AuthCubit extends Cubit<AuthState> {
  final ApiService _api;
  AuthCubit({required this._api}) : super(AuthState(isAuthenticated: false));

  Future<void> init() async {
    final userInfo = await _api.getUserInfo();
    if (userInfo.isAuthenticated) {
      emit(AuthState(isAuthenticated: true, name: userInfo.name ?? ""));
    }
  }

  void login() => _api.login();
}
