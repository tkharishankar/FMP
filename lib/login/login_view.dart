import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fmp/login/login_api.dart';
import 'package:fmp/login/login_viewmodel.dart';
import 'package:fmp/login/model/login_request.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var loginViewmodel = LoginViewmodel(apiFactory: LoginApi());
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  Future doLogin() async {
    LoginReq loginReq = LoginReq(
        username: usernameController.text.trim(),
        password: passwordController.text.trim());
    var res = await loginViewmodel.getAccessToken(loginReq);
    if (kDebugMode) {
      print('${res.access!}${res.refresh}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: TextField(
            controller: usernameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Username',
              labelText: 'Username',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: TextField(
            controller: passwordController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Password',
              labelText: 'Password',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ElevatedButton(
            onPressed: () {
              if (kDebugMode) {
                print('Button clicked');
              }
              doLogin();
            },
            child: const Text('Login'),
          ),
        ),
      ],
    ));
  }
}
