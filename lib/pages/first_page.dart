import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  Color bgColor = const Color(0xffFCFCFC);
  Color appBlack = const Color(0xff212C2E);
  Color appOrange = const Color(0xffFF6F52);
  bool isvisibility = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          backgroundColor: bgColor,
          elevation: 0,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'ԳՈՌ',
                    style: TextStyle(
                        color: appBlack,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.chevron_right_outlined, color: appBlack)
                ],
              ),
              Text(
                'էքսպերտ',
                style: TextStyle(color: appBlack, fontSize: 10),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_outlined,
                color: appBlack,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: appBlack,
              ),
            ),
          ],
          leading: Container(
            margin: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 129, 129, 129),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              iconSize: 20,
              onPressed: () {},
              icon: const Icon(
                Icons.person,
                color: Color(0xff37424A),
              ),
            ),
          ),
        ),
        body: body(),
      ),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            balance(),
            proposal(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Ծառայություններ',
                  style: TextStyle(fontSize: 20),
                ),
                TextButton(onPressed: () {}, child: const Text('դիտել բոլորը'))
              ],
            ),
            services(),
          ],
        ),
      ),
    );
  }

  Widget balance() {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.all(15),
            height: 170,
            decoration: BoxDecoration(
              color: const Color(0xffF3F5F5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      constraints: const BoxConstraints(maxHeight: 36),
                      padding: const EdgeInsets.all(0),
                      onPressed: () {
                        isvisibility = !isvisibility;
                        setState(() {});
                      },
                      icon: Icon(isvisibility
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                  ],
                ),
                const Text('Հաշվեկշիռ'),
                Text(
                  isvisibility ? '* * * *' : '0.00 Դ',
                  style: const TextStyle(fontSize: 20),
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: appOrange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: const Text(
                          'Համալրել',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(5),
            height: 160,
            decoration: BoxDecoration(
              color: const Color.fromARGB(34, 158, 158, 158),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Image(
                image: NetworkImage('https://telcellmoney.am/img/logo500.png')),
          ),
        ),
      ],
    );
  }

  Widget proposal() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          proposalItem(title: 'hgfghfhg', bgColor: Colors.red, imageURL: ''),
          proposalItem(title: '', bgColor: Colors.green, imageURL: ''),
          proposalItem(title: '', bgColor: Colors.orange, imageURL: ''),
          proposalItem(title: '', bgColor: Colors.black, imageURL: ''),
          proposalItem(title: '', bgColor: Colors.amber, imageURL: ''),
          proposalItem(title: '', bgColor: Colors.cyan, imageURL: ''),
          proposalItem(title: '', bgColor: Colors.yellow, imageURL: ''),
        ],
      ),
    );
  }

  Widget proposalItem(
      {required String title,
      String? subtitle,
      required Color bgColor,
      required String imageURL}) {
    return InkWell(
      onTap: (() {}),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 100,
          height: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: bgColor,
          ),
          child: Center(child: Text(title)),
        ),
      ),
    );
  }

  Widget services() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          servicesItem(Icons.credit_card, 'hjbdsjfh'),
          servicesItem(Icons.swap_horiz, ''),
          servicesItem(Icons.directions_bus_filled_outlined, ''),
          servicesItem(Icons.add_card_outlined, ''),
          servicesItem(Icons.celebration_outlined, ''),
          servicesItem(Icons.handshake_outlined, ''),
        ],
      ),
    );
  }

  Widget servicesItem(IconData icon, String title) {
    return InkWell(
      onTap: (() {}),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          alignment: Alignment.topLeft,
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.amber),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Icon(
                  icon,
                  size: 35,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(title),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
