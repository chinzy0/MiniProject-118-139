import 'package:booking_app/pages/success.dart';
import 'package:booking_app/service/sendform.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Book2page extends StatefulWidget {
  const Book2page({super.key});

  @override
  State<Book2page> createState() => _Book2pageState();
}

class _Book2pageState extends State<Book2page> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _surnamebook = TextEditingController();
  final TextEditingController _namebook = TextEditingController();
  final TextEditingController _ID = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final firstDate = DateTime(DateTime.now().year - 120);
  final lastDate = DateTime.now();

  final TextEditingController _telbook = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Booking CAMP 2",
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
        ),
      ),
      body: SafeArea(
          child: Container(
        height: 500,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        margin: EdgeInsets.all(32),
        padding: EdgeInsets.all(24),
        child: Form(
          key: _formkey,
          child: SizedBox(
            width: 320,
            child: ListView(
              children: [
                buildNameInput(),
                buildSurnameInput(),
                buildTelInput(),
                buildEmailInput(),
                buildlDInput(),
                buildDatechooser(),
                SizedBox(
                  height: 20,
                ),
                buildValidation(),
              ],
            ),
          ),
        ),
      )),
    );
  }

  Widget buildTelInput() {
    return TextFormField(
      controller: _telbook,
      keyboardType: TextInputType.phone,
      decoration: const InputDecoration(
        icon: const Icon(Icons.phone),
        hintText: 'เบอร์โทรศัพท์',
        labelText: 'เบอร์โทรศัพท์',
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'กรุณากรอกข้อมูลให้ครบ';
        }
        return null;
      },
    );
  }

  Widget buildNameInput() {
    return TextFormField(
      controller: _namebook,
      decoration: const InputDecoration(
        icon: const Icon(Icons.person),
        hintText: 'ชื่อ',
        labelText: 'ชื่อ',
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'กรุณากรอกข้อมูลให้ครบ';
        }
        return null;
      },
    );
  }

  Widget buildSurnameInput() {
    return TextFormField(
      controller: _surnamebook,
      keyboardType: TextInputType.phone,
      decoration: const InputDecoration(
        icon: const Icon(Icons.person),
        hintText: 'นามสกุล',
        labelText: 'นามสกุล',
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'กรุณากรอกข้อมูลให้ครบ';
        }
        return null;
      },
    );
  }

  Widget buildDatechooser() {
    return TextFormField(
      controller: dateController,
      decoration: const InputDecoration(
        icon: const Icon(Icons.calendar_today),
        hintText: 'วันที่',
        labelText: 'วันที่ต้องการเข้าพัก',
      ),
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(), //get today's date
            firstDate: DateTime(
                2000), //DateTime.now() - not to allow to choose before today.
            lastDate: DateTime(2101));

        if (pickedDate != null) {
          print(
              pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
          String formattedDate = DateFormat('yyyy-MM-dd').format(
              pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
          print(
              formattedDate); //formatted date output using intl package =>  2022-07-04
          //You can format date as per your need

          setState(() {
            dateController.text =
                formattedDate; //set foratted date to TextField value.
          });
        } else {
          print("Date is not selected");
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'กรุณากรอกข้อมูลให้ครบ';
        }
        return null;
      },
    );
  }

  Widget buildEmailInput() {
    return TextFormField(
      controller: _email,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        icon: const Icon(Icons.email),
        hintText: 'Email',
        labelText: 'Email',
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'กรุณากรอกข้อมูลให้ครบ';
        }
        return null;
      },
    );
  }

  Widget buildlDInput() {
    return TextFormField(
      controller: _ID,
      keyboardType: TextInputType.phone,
      decoration: const InputDecoration(
        icon: const Icon(Icons.add_card),
        hintText: 'บัตรประชาชน',
        labelText: 'บัตรประชาชน',
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'กรุณากรอกข้อมูลให้ครบ';
        }
        return null;
      },
    );
  }

  Widget buildValidation() {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.blue[900]),
          foregroundColor: const MaterialStatePropertyAll(Colors.white),
        ),
        onPressed: () {
          if (_formkey.currentState!.validate()) {
            sendform()
                .bform(_namebook.text, _surnamebook.text, _telbook.text,
                    _email.text, _ID.text, dateController.text)
                .then((value) => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const Success())));
          }
        },
        child: const Text("ยืนยัน"));
  }
}
