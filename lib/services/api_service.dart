import 'dart:async';
import '../models/wallet.dart';
import '../models/savings_plan.dart';
import '../models/investment_option.dart';
import '../models/welfare_package.dart';

class ApiService {
  // Simulated backend - replace with real HTTP calls
  Future<Map<String, dynamic>> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 1));
    return {"success": true, "user": {"id": "u1", "name": "Jane Doe", "email": email}};
  }

  Future<Map<String, dynamic>> signup(String name, String email, String password) async {
    await Future.delayed(Duration(seconds: 1));
    return {"success": true, "user": {"id": "u2", "name": name, "email": email}};
  }

  Future<Wallet> fetchWallet(String userId) async {
    await Future.delayed(Duration(milliseconds: 700));
    return Wallet(balance: 120500.00);
  }

  Future<List<SavingsPlan>> fetchSavings(String userId) async {
    await Future.delayed(Duration(milliseconds: 700));
    return [
      SavingsPlan(id: 's1', type: SavingsType.Thrift, balance: 50000),
      SavingsPlan(id: 's2', type: SavingsType.Flex, balance: 15000),
    ];
  }

  Future<List<InvestmentOption>> fetchInvestments() async {
    await Future.delayed(Duration(milliseconds: 700));
    return [
      InvestmentOption(id: 'i1', name: 'Gold Commodity Fund', category: 'Commodities', minAmount: 5000),
      InvestmentOption(id: 'i2', name: 'Global ETF', category: 'Funds', minAmount: 2000),
    ];
  }

  Future<List<WelfarePackageModel>> fetchWelfarePackages() async {
    await Future.delayed(Duration(milliseconds: 500));
    return [
      WelfarePackageModel(id: 'w1', title: 'Basic Healthcare', description: 'Primary care & consultations', monthlyPrice: 2500),
      WelfarePackageModel(id: 'w2', title: 'Education Support', description: 'Courses & resources', monthlyPrice: 1500),
    ];
  }

  Future<dynamic> applyLoan(String userId, double amount) async {
    await Future.delayed(Duration(seconds: 1));
    return {"id": "L\${DateTime.now().millisecondsSinceEpoch}", "amount": amount, "status": "pending"};
  }

  Future<dynamic> applyLoanObject(String userId, double amount) async {
    await Future.delayed(Duration(seconds: 1));
    return {'id': 'l\${DateTime.now().millisecondsSinceEpoch}', 'amount': amount, 'status': 'pending'};
  }

  Future<dynamic> placeholder() async {
    await Future.delayed(Duration(milliseconds: 200));
    return {};
  }
}
