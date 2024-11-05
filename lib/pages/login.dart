import 'package:chat_app/components/button.dart';
import 'package:chat_app/components/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../auth/auth_service.dart';
import '../auth/log_reg.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailControler = TextEditingController();
  final TextEditingController _pwControler = TextEditingController();

  final void Function()? onTap;
  LoginPage({super.key, required this.onTap});
  //todo implement login
  void login(BuildContext context) async {
    final authService = AuthService();

    //try login
    try {
      await authService.signInWithEmailPassword(
          _emailControler.text, _pwControler.text);
    }
    //catch errors
    catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(title: Text(e.toString())));
    }
  }

  //go to register page
  toRegister() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.tertiary,
        ),
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            //logo
            Image.asset(
                width: 128,
                height: 128,
                'assets/images/128px-Cib_Logo.svg.png'),
            const SizedBox(
              height: 20,
            ),
            //welcome message
            Text(
              "Welcome back",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: 'Lato',
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MyTextField(
              hintText: "Email",
              obscureText: false,
              controler: _emailControler,
            ),
            const SizedBox(
              height: 20,
            ),
            MyTextField(
              hintText: "Password",
              obscureText: true,
              controler: _pwControler,
            ),
            const SizedBox(
              height: 25,
            ),
            MyButton(
              text: "Login",
              onPressed: () {
                login(context);
              },
            ),

            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Need an account?"),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Register",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                )
              ],
            ),
          ]),
        ));
  }
}
