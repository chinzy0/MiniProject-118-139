import 'package:booking_app/pages/camp1.dart';
import 'package:booking_app/pages/camp2.dart';
import 'package:booking_app/pages/camp3.dart';
import 'package:booking_app/pages/historypage.dart';
import 'package:booking_app/pages/loginpage.dart';
import 'package:booking_app/pages/registerpage.dart';
import 'package:booking_app/service/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Historypage()));
          },
          child: Icon(
            Icons.history,
          ),
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  AuthService().signOut().then((value) =>
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Loginpage())));
                },
                child: Icon(
                  Icons.exit_to_app,
                  size: 26.0,
                ),
              )),
        ],
        elevation: 0.0,
        backgroundColor: Colors.blue[900],
        title: Text(
          'Homepage',
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.blue[900],
                  image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: AssetImage('assets/images/wallpaper.jpg'))),
              height: 100,
              child: Text(
                "  Welcome  ",
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            SizedBox(
              height: 30.0,
            ),
            SizedBox(
              child: Container(
                child: Text(
                  ' ลานที่ 1 ',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                ),
                decoration: BoxDecoration(
                    color: Colors.blue[900],
                    image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/camp1.jpg'))),
                height: 250,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            SizedBox(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  backgroundColor: Colors.blue[900],
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                ),
                child: Text(
                  "ดูรายละเอียด",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Camp1page()));
                },
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            SizedBox(
              child: Container(
                child: Text(
                  ' ลานที่ 2 ',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                ),
                decoration: BoxDecoration(
                    color: Colors.blue[100],
                    image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/camp2.jpg'))),
                height: 250,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            SizedBox(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  backgroundColor: Colors.blue[900],
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                ),
                child: Text(
                  "ดูรายละเอียด",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Camp2page()));
                },
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            SizedBox(
              child: Container(
                child: Text(
                  ' ลานที่ 3 ',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                ),
                decoration: BoxDecoration(
                    color: Colors.blue[100],
                    image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/camp3.jpg'))),
                height: 250,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            SizedBox(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  backgroundColor: Colors.blue[900],
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                ),
                child: Text(
                  "ดูรายละเอียด",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Camp3page()));
                },
              ),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
