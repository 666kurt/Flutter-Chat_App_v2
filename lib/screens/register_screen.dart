import 'package:firebase_chat_app/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final void Function()? onTap;

  RegisterScreen({
    super.key,
    required this.onTap,
  });

  void register_method(BuildContext context) async {
    final _auth = AuthService();

    if (_passwordController.text == _confirmPasswordController.text) {
      try {
        _auth.signUp(_emailController.text, _passwordController.text);
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Password dont match'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            SizedBox(
              height: 50,
            ),

            // message
            Text(
              'Create an account for you',
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontSize: 18,
              ),
            ),

            SizedBox(
              height: 25,
            ),

            // email tf
            CustomTextField(
              hintText: 'Enter email...',
              isSecure: false,
              controller: _emailController,
            ),

            SizedBox(
              height: 10,
            ),

            // password tf
            CustomTextField(
              hintText: 'Enter password...',
              isSecure: true,
              controller: _passwordController,
            ),

            SizedBox(
              height: 10,
            ),

            // password tf
            CustomTextField(
              hintText: 'Confirm password...',
              isSecure: true,
              controller: _confirmPasswordController,
            ),

            SizedBox(
              height: 15,
            ),

            // login button
            CustomButton(
              textButton: 'Register',
              onTap: () => register_method(context),
            ),

            SizedBox(
              height: 15,
            ),

            // register button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account? ',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    'Log in',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
