import 'package:chat_app/components/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
            const MyTextField(
              hintText: "Email",
              obscureText: false,
            ),
            const SizedBox(
              height: 20,
            ),
            const MyTextField(
              hintText: "Password",
              obscureText: true,
            ),
            const SizedBox(
              height: 20,
            ),
          ]),
        ));
  }
}
