import 'package:calaulate/pages/calc.dart';
import 'package:calaulate/pages/contact.dart';
import 'package:calaulate/pages/home.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MainPage());
  }
}
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  State<MainPage> createState() => _MainPageState();
}
class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final taps = [
    HomePage(), CalculatePage(), ContactPage() //เก็บค่าหลายค่านับจาก 0
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("RW1968 Minimart")),
      body: taps[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "หน้าแรก"),
          BottomNavigationBarItem(icon: Icon(Icons.calculate),label: "คำนวณ"),
          BottomNavigationBarItem(icon: Icon(Icons.contact_page),label: "ติดต่อเรา"),
        ],
        onTap: (index){
          setState(() {
            print(index);
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
