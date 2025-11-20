import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/api_service.dart';

class AuthProvider extends ChangeNotifier {
  final ApiService api = ApiService();
  User? user;
  bool loading = false;
  String? error;

  bool get isAuthenticated => user != null;

  Future<void> login(String email, String password) async {
    loading = true; error = null; notifyListeners();
    try {
      final res = await api.login(email, password);
      user = User.fromJson(res['user']);
    } catch (e) {
      error = e.toString();
    }
    loading = false; notifyListeners();
  }

  Future<void> signup(String name, String email, String password) async {
    loading = true; error = null; notifyListeners();
    try {
      final res = await api.signup(name, email, password);
      user = User.fromJson(res['user']);
    } catch (e) {
      error = e.toString();
    }
    loading = false; notifyListeners();
  }

  void logout() {
    user = null;
    notifyListeners();
  }
}
