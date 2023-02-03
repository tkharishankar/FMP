import 'package:flutter/material.dart';
import 'login/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink),
      ),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: LoginView(),
        ),
      ),
    );
  }
}
