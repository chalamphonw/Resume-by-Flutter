import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentPrime = 2; // เริ่มต้นที่จำนวนเฉพาะตัวแรก 2
  List<int> primeList = [];

  // ฟังก์ชันตรวจสอบว่าเป็นจำนวนเฉพาะหรือไม่
  bool isPrime(int number) {
    if (number <= 1) return false;
    for (int i = 2; i <= sqrt(number); i++) {
      if (number % i == 0) {
        return false;
      }
    }
    return true;
  }

  // ฟังก์ชันเพิ่มจำนวนเฉพาะถัดไป
  void addNextPrime() {
    int nextPrime = currentPrime + 1;
    // หาเลขจำนวนเฉพาะถัดไป
    while (!isPrime(nextPrime)) {
      nextPrime++;
    }
    setState(() {
      currentPrime = nextPrime; // กำหนดค่า currentPrime ใหม่
      primeList.add(currentPrime); // เพิ่มจำนวนเฉพาะใหม่เข้าใน list
    });
  }

  // ฟังก์ชันลดจำนวนเฉพาะก่อนหน้า
  void subtractPreviousPrime() {
    int prevPrime = currentPrime - 1;
    // หาเลขจำนวนเฉพาะที่น้อยกว่าปัจจุบัน
    while (prevPrime > 1 && !isPrime(prevPrime)) {
      prevPrime--;
    }
    if (prevPrime > 1) {
      setState(() {
        currentPrime = prevPrime; // กำหนดค่า currentPrime ใหม่
        primeList.add(currentPrime); // เพิ่มจำนวนเฉพาะก่อนหน้าเข้าใน list
      });
    }
  }

  @override
  void initState() {
    super.initState();
    primeList.add(currentPrime); // เพิ่มจำนวนเฉพาะแรก (2) เข้าใน list
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Personal Info",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Personal Info"),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "-------------------------------------",
                  style: TextStyle(fontFamily: 'Courier', fontSize: 16),
                ),
                Center(
                  child: Image.network(
                    'jojo.jpg', // Your image link
                    width: 100,
                    height: 100,
                  ),
                ),
                Text(
                  "-------------------------------------",
                  style: TextStyle(fontFamily: 'Courier', fontSize: 16),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Firstname: chalamphon"),
                    Text("Lastname: wongsunthon"),
                    Text("Nickname: miw"),
                  ],
                ),
                SizedBox(height: 16),
                Text("Hobby: Playgame"),
                Text("Food: duck noodles"),
                Text("Birthplace: Phichit"),
                SizedBox(height: 16),
                Text("Education: Mathayom 6"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("elementary:  Ban Wang Phrao School year: 50"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("primary: BanWangPhrao year: 55"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("high school: Phothithammasuwat year: 60"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Undergrad: Naresuan university year: 65"),
                  ],
                ),
                Text(
                  "-------------------------------------",
                  style: TextStyle(fontFamily: 'Courier', fontSize: 16),
                ),
                SizedBox(height: 16),
                // แสดงจำนวนเฉพาะปัจจุบัน
                Text(
                  "Current Prime Number: $currentPrime",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 16),
                // ปุ่มเพิ่มจำนวนเฉพาะถัดไป
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: subtractPreviousPrime,
                      child: Text("Add Previous Prime (-)"),
                    ),
                    ElevatedButton(
                      onPressed: addNextPrime,
                      child: Text("Add Next Prime (+)"),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                // แสดงรายการจำนวนเฉพาะใน ListView
                Expanded(
                  child: ListView.builder(
                    itemCount: primeList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text("Prime ${index + 1}: ${primeList[index]}"),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
