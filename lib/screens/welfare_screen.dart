import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/welfare_package.dart';

class WelfareScreen extends StatelessWidget {
  final repo = ApiService();

  WelfareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welfare Packages')),
      body: FutureBuilder<List<WelfarePackageModel>>(
        future: repo.fetchWelfarePackages(),
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
                  title: Text(it.title),
                  subtitle: Text(it.description),
                  trailing: ElevatedButton(
                    onPressed: () {},
                    child: Text('Subscribe'),
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
