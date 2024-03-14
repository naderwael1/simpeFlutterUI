// LoginScreen.dart

import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Username',
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {

                  Navigator.pushReplacementNamed(context, '/home');
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
