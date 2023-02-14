import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fmp/login/login_api.dart';
import 'package:fmp/login/login_viewmodel.dart';
import 'package:fmp/login/model/login_response.dart';
import 'package:fmp/projects/projects_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var loginViewmodel = LoginViewmodel(loginApi: LoginApiImpl());
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<LoginResp?> doLogin() async {
    return await loginViewmodel.getAccessToken(
        usernameController.text.trim(), passwordController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
              doLogin().whenComplete(() => {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProjectsView(),
                        )),
                  });
            },
            child: const Text('Login'),
          ),
        ),
      ],
    );
  }
}
