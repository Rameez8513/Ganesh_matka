import 'package:flutter/material.dart';
import '../widgets/auth.dart';
import '../Auth_pages/login.dart';

class RegistrationPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAuthCard( 
      title: 'Registration',
      subtitle: 'Sign up your account',
      imagePath: "assets/images/logo.jpeg",
      fields: [
        ReusableInputField(
          controller: usernameController,
          hintText: 'Enter Username',
          icon: Icons.person,
        ),
        ReusableInputField(
          controller: phoneController,
          hintText: 'Enter Phone Number',
          icon: Icons.phone_android,
        ),
        ReusableInputField(
          controller: passwordController,
          hintText: 'Enter Password',
          icon: Icons.lock,
          isPassword: true,
        ),
      ],
      onButtonPressed: () {
        if (usernameController.text.isEmpty ||
            phoneController.text.isEmpty ||
            passwordController.text.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Please fill in all fields."),
              duration: Duration(seconds: 2),
            ),
          );
        } else {
          debugPrint("Username: ${usernameController.text}");
          debugPrint("Phone: ${phoneController.text}");
          debugPrint("Password: ${passwordController.text}");
        }
      },
      buttonText: 'REGISTER',
      bottomLink: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        },
        child: const Text.rich(
          TextSpan(
            text: "Already have an account ? ",
            style: TextStyle(color: Colors.black54),
            children: [
              TextSpan(
                text: 'Log In',
                style: TextStyle(
                  color: Color(0xFF1B8560),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      onContactAdminPressed: () {},
    );
  }
}
