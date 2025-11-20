import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/loan_provider.dart';
import '../providers/auth_provider.dart';

class LoansScreen extends StatelessWidget {
  const LoansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loanProv = Provider.of<LoanProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Loans')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Apply for fast, AI-driven loan approvals.'),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () async {
                final auth = Provider.of<AuthProvider>(context, listen: false);
                if (!auth.isAuthenticated) {
                  Navigator.pushNamed(context, '/login');
                  return;
                }
                final amount = await _askAmount(context);
                if (amount != null) await loanProv.apply(auth.user!.id, amount);
              },
              child: Text('Apply for Loan'),
            ),
            SizedBox(height: 12),
            if (loanProv.applying) CircularProgressIndicator(color: Colors.red),
            ...loanProv.loans.map(
              (l) => Card(
                child: ListTile(
                  title: Text('₦${l.amount.toStringAsFixed(2)}'),
                  subtitle: Text('Status: ${l.status}'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<double?> _askAmount(BuildContext context) async {
    final ctl = TextEditingController();
    return showDialog<double?>(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text('Loan Amount'),
          content: TextField(
            controller: ctl,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: 'Enter amount'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final v = double.tryParse(ctl.text);
                Navigator.pop(context, v);
              },
              child: Text('Apply'),
            ),
          ],
        );
      },
    );
  }
}
