import 'package:flutter/material.dart';
import '../models/loan_application.dart';
import '../services/api_service.dart';

class LoanProvider extends ChangeNotifier {
  final ApiService api = ApiService();
  List<LoanApplication> loans = [];
  bool applying = false;

  Future<void> apply(String userId, double amount) async {
    applying = true; notifyListeners();
    final app = await api.applyLoan(userId, amount);
    loans.insert(0, app);
    applying = false; notifyListeners();
  }
}
