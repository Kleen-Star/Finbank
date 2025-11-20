import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class LoginScreen extends StatelessWidget {
  final email = TextEditingController();
  final password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: email,
                decoration: InputDecoration(labelText: "Email"),
                validator: (v) =>
                    v != null && v.contains("@") ? null : "Enter a valid email",
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: password,
                decoration: InputDecoration(labelText: "Password"),
                obscureText: true,
                validator: (v) =>
                    v != null && v.length >= 6 ? null : "Minimum 6 characters",
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await auth.login(email.text.trim(), password.text.trim());
                    if (auth.user != null) {
                      Navigator.pushReplacementNamed(context, '/dashboard');
                    } else {
                      final snack = ScaffoldMessenger.of(context);
                      snack.showSnackBar(
                        SnackBar(content: Text('Login failed')),
                      );
                    }
                  }
                },
                child: auth.loading
                    ? SizedBox(
                        height: 16,
                        width: 16,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : Text("Login"),
              ),
              SizedBox(height: 12),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/signup'),
                child: Text("Create an account"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
