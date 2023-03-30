import 'package:booking_app/pages/homepage.dart';
import 'package:booking_app/pages/registerpage.dart';
import 'package:flutter/material.dart';

class Success extends StatefulWidget {
  const Success({super.key});

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/thx.jpg"),
              fit: BoxFit.fitHeight),
        ),

        child: Center(
          child: Column(
            children: [
              Text(
                'Thank you for booking.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                ),
              ),
              buildReturnHome()
            ],
          ),
        ),
        // Fore
      ),
    );
  }

  Widget buildReturnHome() {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.blue[900]),
          foregroundColor: const MaterialStatePropertyAll(Colors.white),
        ),
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const Homepage(),
              ));
        },
        child: const Text("กลับหน้าหลัก"));
  }
}
