import 'package:flutter/material.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  bool stylePage = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: const Color.fromARGB(255, 0, 0, 0),
        backgroundColor: Colors.white,
        title: const Text(
          'Ծառայություններ',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              onPressed: () {
                stylePage = !stylePage;
                setState(() {});
              },
              icon: Icon(
                stylePage ? Icons.list : Icons.grid_view,
                size: 35,
              ),
            ),
          )
        ],
      ),
      body: stylePage ? gridView() : listView(),
    );
  }

  Widget gridView() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.count(
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        crossAxisCount: 3,
        children: [
          gridViweItem(Icons.credit_card, 'Վճարումներ'),
          gridViweItem(Icons.swap_horiz, 'Փոխանցում'),
          gridViweItem(Icons.directions_bus_filled_outlined, 'Տրանսպորտ'),
          gridViweItem(Icons.add_card_outlined, 'Վարկավորում'),
          gridViweItem(Icons.celebration_outlined, 'Միջոցառումներ'),
          gridViweItem(Icons.handshake_outlined, 'Գոռծընկերներ'),
        ],
      ),
    );
  }

  Widget gridViweItem(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: const Color(0xffFF6F52),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(text),
        ],
      ),
    );
  }

  Widget listView() {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        listViewItem(Icons.credit_card, '     Վճարումներ'),
        listViewItem(Icons.swap_horiz, '     Փոխանցում'),
        listViewItem(Icons.directions_bus_filled_outlined, '     Տրանսպորտ'),
        listViewItem(Icons.add_card_outlined, '     Վարկավորում'),
        listViewItem(Icons.celebration_outlined, '     Միջոցառումներ'),
        listViewItem(Icons.handshake_outlined, '     Գոռծընկերներ'),
      ],
    );
  }

  Widget listViewItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(8),
          height: 55,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade200,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: const Color(0xffFF6F52),
              ),
              Text(text),
              const Expanded(child: SizedBox()),
              const Icon(
                Icons.arrow_forward_ios,
                size: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}
