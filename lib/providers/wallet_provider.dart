import 'package:flutter/material.dart';
import '../models/wallet.dart';
import '../services/api_service.dart';

class WalletProvider extends ChangeNotifier {
  final ApiService api = ApiService();
  Wallet? wallet;
  bool loading = false;

  Future<void> loadWallet(String userId) async {
    loading = true; notifyListeners();
    wallet = await api.fetchWallet(userId);
    loading = false; notifyListeners();
  }
}
