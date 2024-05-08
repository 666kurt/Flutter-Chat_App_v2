import 'package:firebase_chat_app/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final void Function()? onTap;

  LoginScreen({
    super.key,
    required this.onTap,
  });

  void login_method(BuildContext context) async {
    final authService = AuthService();

    try {
      await authService.signIn(
        _emailController.text,
        _passwordController.text,
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
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
              'Welcome back!',
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
              height: 15,
            ),

            // login button
            CustomButton(
              textButton: 'Log in',
              onTap: () => login_method(context),
            ),

            SizedBox(
              height: 15,
            ),

            // register button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Dont have account? ',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    'Register now',
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
