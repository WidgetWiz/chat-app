import 'package:chat_app/components/button.dart';
import 'package:chat_app/components/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailControler = TextEditingController();
  final TextEditingController _pwControler = TextEditingController();

  LoginPage({super.key});
  //todo implement login
  login() {}

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
                login;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                TextButton(
                  onPressed: () {},
                  child: Text("Sign up"),
                ),
              ],
            ),
          ]),
        ));
  }
}
