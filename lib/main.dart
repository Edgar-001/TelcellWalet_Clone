import 'package:flutter/material.dart';
import 'package:telcellwallet_clone/pages_tab/home_tab.dart';
import 'package:telcellwallet_clone/pages_tab/bank_tab.dart';
import 'package:telcellwallet_clone/pages_tab/qr_tab.dart';
import 'package:telcellwallet_clone/pages_tab/bon_tab.dart';

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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int currentIndexBotBar = 0;
  Color appOrange = const Color(0xffFF6F52);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: body(),
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

  Widget body() {
    return getBody();
  }

  Widget getBody() {
    switch (currentIndexBotBar) {
      case 0:
        return const HomeTabPage();
      case 1:
        return const BonTabPage();
      case 2:
        return QRCodeTab();
      case 3:
        return const BankTabPage();
      default:
        return Container();
    }
  }
}
