// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:sesion9/index.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                authService.cerrarSesion();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                    (route) => false);
              },
              icon: Icon(
                Icons.exit_to_app,
                size: 32,
              ))
        ],
      ),
      drawer: DrawerWidget(),
      body: Center(
        child: Text(
          'Home Page',
          style: TextStyle(fontSize: 32),
        ),
      ),
    );
  }
}
