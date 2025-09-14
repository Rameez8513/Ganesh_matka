import 'package:flutter/material.dart';
import '../widgets/auth.dart';
import '../Auth_pages/register.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAuthCard(
      title: "Login",
      subtitle: "Sign in to your account",
      imagePath: "assets/images/logo.jpeg",
      hasForgotPassword: true,
      fields: [
        ReusableInputField(
          controller: phoneController,
          hintText: "Enter Phone Number",
          icon: Icons.phone_android,
        ),
        ReusableInputField(
          controller: passwordController,
          hintText: "Enter Password",
          icon: Icons.lock,
          isPassword: true,
        ),
      ],
      onButtonPressed: () {
        // Show a SnackBar if fields are empty
        if (phoneController.text.isEmpty || passwordController.text.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Please fill in all fields."),
              duration: Duration(seconds: 2),
            ),
          );
        } else {
          debugPrint("Phone: ${phoneController.text}");
          debugPrint("Password: ${passwordController.text}");
          
        }
      },
      buttonText: "Login",
      bottomLink: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RegistrationPage()),
          );
        },
        child: const Text.rich(
          TextSpan(
            text: "Don't have an account? ",
            style: TextStyle(color: Colors.black54),
            children: [
              TextSpan(
                text: 'Sign Up',
                style: TextStyle(
                  color: Color(0xFF1B8560),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
