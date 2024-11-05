import 'package:flutter/material.dart';
import '../components/button.dart';
import '../components/text_field.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final TextEditingController _emailControler = TextEditingController();
  final TextEditingController _pwControler = TextEditingController();
  final TextEditingController _cPwControler = TextEditingController();
//todo
  register() {}
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
              "Let's create your account",
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
              height: 10,
            ),
            MyTextField(
              hintText: "Confirm Password",
              obscureText: true,
              controler: _cPwControler,
            ),
            const SizedBox(
              height: 25,
            ),
            MyButton(
              text: "Register",
              onPressed: () {
                register();
              },
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?"),
                TextButton(
                  onPressed: () {},
                  child: Text("Log-in"),
                ),
              ],
            ),
          ]),
        ));
  }
}
