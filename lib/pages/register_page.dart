import 'package:flutter/material.dart';
import '../auth/auth_service.dart';
import '../components/button.dart';
import '../components/text_field.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key, required this.onTap});

  final TextEditingController _emailControler = TextEditingController();
  final TextEditingController _pwControler = TextEditingController();
  final TextEditingController _cPwControler = TextEditingController();
  final void Function()? onTap;

  // Register function
  void register(BuildContext context) {
    final _auth = AuthService();

    if (_pwControler.text == _cPwControler.text) {
      try {
        _auth.signUpWithEmailPassword(_emailControler.text, _pwControler.text);
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(title: Text(e.toString())),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Passwords do not match"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.tertiary,
      ),
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Image.asset(
              'assets/images/128px-Cib_Logo.svg.png',
              width: 128,
              height: 128,
            ),
            const SizedBox(height: 20),

            // Welcome message
            Text(
              "Let's create your account",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: 'Lato',
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),

            // Email field
            MyTextField(
              hintText: "Email",
              obscureText: false,
              controler: _emailControler,
            ),
            const SizedBox(height: 20),

            // Password field
            MyTextField(
              hintText: "Password",
              obscureText: true,
              controler: _pwControler,
            ),
            const SizedBox(height: 10),

            // Confirm password field
            MyTextField(
              hintText: "Confirm Password",
              obscureText: true,
              controler: _cPwControler,
            ),
            const SizedBox(height: 25),

            // Register button
            MyButton(
              text: "Register",
              onPressed: () {
                register(context);
              },
            ),
            const SizedBox(height: 25),

            // Already have an account? Log in
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?"),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Log-in",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
