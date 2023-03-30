import 'package:cloud_firestore/cloud_firestore.dart';

class sendform {
  Future<void> aform(String name, String surname, String tel, String email,
      String idcard, String date) async {
    try {
      final collection = FirebaseFirestore.instance.collection('Camp1Booked');

      await collection.doc().set({
        "name": name,
        "surname": surname,
        "tel": tel,
        "email": email,
        "idcard": idcard,
        "date": date,
      });

      print('Feedback sent successfully');
    } catch (e) {
      print('Error when sending feedback');
    }
  }

  Future<void> bform(String name, String surname, String tel, String email,
      String idcard, String date) async {
    try {
      final collection = FirebaseFirestore.instance.collection('Camp2Booked');

      await collection.doc().set({
        "name": name,
        "surname": surname,
        "tel": tel,
        "email": email,
        "idcard": idcard,
        "date": date,
      });

      print('Feedback sent successfully');
    } catch (e) {
      print('Error when sending feedback');
    }
  }

  Future<void> cform(String name, String surname, String tel, String email,
      String idcard, String date) async {
    try {
      final collection = FirebaseFirestore.instance.collection('Camp3Booked');

      await collection.doc().set({
        "name": name,
        "surname": surname,
        "tel": tel,
        "email": email,
        "idcard": idcard,
        "date": date,
      });

      print('Feedback sent successfully');
    } catch (e) {
      print('Error when sending feedback');
    }
  }
}
