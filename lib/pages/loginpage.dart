import 'package:auth_buttons/auth_buttons.dart';
import 'package:booking_app/pages/camp1.dart';
import 'package:booking_app/pages/historypage.dart';
import 'package:booking_app/pages/homepage.dart';
import 'package:booking_app/pages/registerpage.dart';
import 'package:booking_app/pages/success.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../service/auth_service.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

final _email = TextEditingController();
final _password = TextEditingController();
final _formKey = GlobalKey<FormState>();

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.blue[900],
            child: Form(
              key: _formKey,
              child: Center(
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    margin: EdgeInsets.all(32),
                    padding: EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 320,
                          child: Column(
                            children: [
                              buildEmailInput(),
                              buildPasswordInput(),
                            ],
                          ),
                        ),
                        buildEmailSignin(),
                        buildEmailSignup(),
                      ],
                    )),
              ),
            )));
  }

  Widget buildEmailSignup() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Don't have an account?"),
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterPage(),
                  ));
            },
            child: const Text("Register now !"),
          )
        ],
      ),
    );
  }

  Widget buildEmailSignin() {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.blue[900]),
          foregroundColor: const MaterialStatePropertyAll(Colors.white),
        ),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            AuthService.loginUser(_email.text, _password.text).then((value) {
              if (value == 1) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Homepage()),
                );
              }
            });
          }
        },
        child: const Text("Sing in"));
  }

  TextFormField buildEmailInput() {
    return TextFormField(
      controller: _email,
      decoration: const InputDecoration(labelText: "E-mail"),
      validator: (value) {
        if (value!.isEmpty) {
          return "กรุณากรอก Email";
        }
      },
    );
  }

  TextFormField buildPasswordInput() {
    return TextFormField(
      controller: _password,
      obscureText: true,
      validator: (value) {
        if (value!.isEmpty) {
          return "กรุณากรอก Password";
        }
      },
      decoration: const InputDecoration(
        labelText: "Password",
      ),
    );
  }
}
