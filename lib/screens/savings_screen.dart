import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/savings_provider.dart';

class SavingsScreen extends StatelessWidget {
  const SavingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<SavingsProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Savings Plans')),
      body: prov.loading
          ? Center(child: CircularProgressIndicator(color: Colors.red))
          : ListView(
              padding: EdgeInsets.all(16),
              children: prov.plans.map((p) {
                return Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.account_balance_wallet,
                      color: Colors.red,
                    ),
                    title: Text(p.label),
                    subtitle: Text('₦${p.balance.toStringAsFixed(2)}'),
                    trailing: ElevatedButton(
                      onPressed: () {},
                      child: Text('Manage'),
                    ),
                  ),
                );
              }).toList(),
            ),
    );
  }
}
