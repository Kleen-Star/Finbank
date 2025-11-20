import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';
import '../providers/wallet_provider.dart';
import '../providers/savings_provider.dart';

import '../widgets/quick_action.dart';
import '../widgets/drawer_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    final wallet = Provider.of<WalletProvider>(context);
    final savings = Provider.of<SavingsProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("FinBank")),
      drawer: AppDrawer(),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text(
            "Welcome, ${auth.user?.name ?? 'User'}",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 16),

          // Wallet card
          Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Wallet Balance",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "₦${wallet.wallet?.balance.toStringAsFixed(2) ?? '0.00'}",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text("Fund Wallet"),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text("Transfer"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 20),
          Text("Quick Actions", style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: QuickAction(
                  icon: Icons.savings,
                  label: "Savings",
                  onTap: () {},
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: QuickAction(
                  icon: Icons.health_and_safety,
                  label: "Welfare",
                  onTap: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
