import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/investment_option.dart';

class InvestmentsScreen extends StatelessWidget {
  final repo = ApiService();

  InvestmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Investments')),
      body: FutureBuilder<List<InvestmentOption>>(
        future: repo.fetchInvestments(),
        builder: (_, snap) {
          if (!snap.hasData) {
            return Center(child: CircularProgressIndicator(color: Colors.red));
          }
          final items = snap.data!;
          return ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: items.length,
            itemBuilder: (_, i) {
              final it = items[i];
              return Card(
                child: ListTile(
                  title: Text(it.name),
                  subtitle: Text(it.category),
                  trailing: ElevatedButton(
                    onPressed: () {},
                    child: Text('Invest'),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
