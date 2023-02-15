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
  var errorMessage = "";

  var isError = false;
  void updateError(bool state) {
    setState(() {
      isError = state;
    });
  }

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
            obscureText: true,
            autocorrect: false,
            enableSuggestions: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Password',
              labelText: 'Password',
            ),
          ),
        ),
        actionButton(context),
        Visibility(
            visible: isError,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                errorMessage,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.redAccent),
              ),
            ))
      ],
    );
  }

  Padding actionButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(fixedSize: const Size(150, 55)),
        onPressed: () {
          if (kDebugMode) {
            print('Button clicked');
          }
          if (usernameController.text.trim().isEmpty) {
            updateError(true);
            errorMessage = "Username can't be empty";
          } else if (passwordController.text.trim().isEmpty) {
            updateError(true);
            errorMessage = "Password can't be empty";
          } else {
            updateError(false);
            doLogin().whenComplete(() => {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProjectsView(),
                      )),
                });
          }
        },
        child: const Text('Login'),
      ),
    );
  }
}
