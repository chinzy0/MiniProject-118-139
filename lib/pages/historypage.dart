import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Historypage extends StatefulWidget {
  const Historypage({super.key});

  @override
  State<Historypage> createState() => _HistorypageState();
}

class _HistorypageState extends State<Historypage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        elevation: 0,
        centerTitle: true,
        title: Text(
          "History",
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 250,
            child: ListView(
              children: [
                SizedBox(
                  height: 10,
                ),
                showRealtimeChange(),
              ],
            ),
          ),
          SizedBox(
            height: 250,
            child: ListView(
              children: [
                showRealtimeChange2(),
              ],
            ),
          ),
          SizedBox(
            height: 250,
            child: ListView(
              children: [
                showRealtimeChange3(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget showRealtimeChange() {
    return Column(
      children: [
        const Text(
          "ประวัติการจอง ลานที่ 1",
        ),
        createRealTimeDate(),
      ],
    );
  }

  Widget createRealTimeDate() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("Camp1Booked").snapshots(),
      builder: (context, snapshot) {
        print(snapshot.connectionState);
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          print(snapshot.data!.docs);
          return Column(
            children: createDataList(snapshot.data),
          );
        }
      },
    );
  }

  List<Widget> createDataList(QuerySnapshot<Map<String, dynamic>>? data) {
    List<Widget> widgets = [];
    widgets = data!.docs.map((doc) {
      var data = doc.data();
      print(data['name']);
      return ListTile(
        onTap: () {
          print(doc.id);
          // ดึงข้อมูล มาแสดง เพื่อแก้ไข
        },
        title: Text('ชื่อ :  ' +
            data['name'] +
            '  ' +
            "เบอร์โทร : " +
            data['tel'].toString()),
        subtitle: Text('วันที่ ' + data['date']),
      );
    }).toList();

    return widgets;
  }

  Widget showRealtimeChange2() {
    return Column(
      children: [
        const Text(
          "ประวัติการจอง ลานที่ 2",
        ),
        createRealTimeDate2(),
      ],
    );
  }

  Widget createRealTimeDate2() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("Camp2Booked").snapshots(),
      builder: (context, snapshot) {
        print(snapshot.connectionState);
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          print(snapshot.data!.docs);
          return Column(
            children: createDataList(snapshot.data),
          );
        }
      },
    );
  }

  Widget showRealtimeChange3() {
    return Column(
      children: [
        const Text(
          "ประวัติการจอง ลานที่ 3",
        ),
        createRealTimeDate3(),
      ],
    );
  }

  Widget createRealTimeDate3() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("Camp3Booked").snapshots(),
      builder: (context, snapshot) {
        print(snapshot.connectionState);
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          print(snapshot.data!.docs);
          return Column(
            children: createDataList(snapshot.data),
          );
        }
      },
    );
  }
}
