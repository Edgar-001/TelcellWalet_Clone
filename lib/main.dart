import 'package:flutter/material.dart';
import 'package:telcellwallet_clone/pages/first_page.dart';
import 'package:telcellwallet_clone/pages/fourth_page.dart';
import 'package:telcellwallet_clone/pages/third_page.dart';
import 'package:telcellwallet_clone/pages/two_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

//////////////////////////////////////////////////////////////////
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  late List _pages;
  int currentIndexBotBar = 0;
  Color appOrange = const Color(0xffFF6F52);
  @override
  Widget build(BuildContext context) {
    _pages = [
      const FirstPage(),
      const SecondPage(),
      const ThirdPage(),
      const FourthPage(),
    ];
    return SafeArea(
      child: Scaffold(
        body: _pages[currentIndexBotBar],
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.blue,
          currentIndex: currentIndexBotBar,
          onTap: (value) {
            currentIndexBotBar = value;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Գլխավոր"),
            BottomNavigationBarItem(icon: Icon(Icons.local_mall), label: "BON"),
            BottomNavigationBarItem(
                icon: Icon(Icons.qr_code), label: "QR Code"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_balance), label: "Բանկինգ"),
          ],
        ),
      ),
    );
  }
}