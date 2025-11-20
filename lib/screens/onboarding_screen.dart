import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  final PageController controller = PageController();
  final pages = [
    {
      "title": "One App, Every Financial Need",
      "subtitle": "Banking, savings, loans & investments in one platform.",
    },
    {
      "title": "Smart Savings",
      "subtitle": "Thrift, Flex, Flex Extra and Custom Target plans.",
    },
    {
      "title": "Welfare Packages",
      "subtitle":
          "Healthcare, insurance, education & utilities in installments.",
    },
  ];

  OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome to FinBank")),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller,
              itemCount: pages.length,
              itemBuilder: (_, i) => _buildPage(
                title: pages[i]['title']!,
                subtitle: pages[i]['subtitle']!,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: Text("Get Started"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage({required String title, required String subtitle}) {
    return Padding(
      padding: EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.account_balance, color: Colors.red, size: 120),
          SizedBox(height: 40),
          Text(
            title,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 12),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
