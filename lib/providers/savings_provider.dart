import 'package:flutter/material.dart';
import '../models/savings_plan.dart';
import '../services/api_service.dart';

class SavingsProvider extends ChangeNotifier {
  final ApiService api = ApiService();
  List<SavingsPlan> plans = [];
  bool loading = false;

  Future<void> loadSavings(String userId) async {
    loading = true; notifyListeners();
    plans = await api.fetchSavings(userId);
    loading = false; notifyListeners();
  }
}
