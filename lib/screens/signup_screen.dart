import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class SignupScreen extends StatelessWidget {
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Sign Up")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: name,
                decoration: InputDecoration(labelText: "Full Name"),
                validator: (v) => v != null && v.isNotEmpty ? null : "Required",
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: email,
                decoration: InputDecoration(labelText: "Email"),
                validator: (v) =>
                    v != null && v.contains("@") ? null : "Enter valid email",
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(labelText: "Password"),
                validator: (v) =>
                    v != null && v.length >= 6 ? null : "Minimum 6 characters",
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await auth.signup(
                      name.text.trim(),
                      email.text.trim(),
                      password.text.trim(),
                    );
                    if (auth.user != null) {
                      Navigator.pushReplacementNamed(context, '/dashboard');
                    } else {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text('Signup failed')));
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
                    : Text("Create Account"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
