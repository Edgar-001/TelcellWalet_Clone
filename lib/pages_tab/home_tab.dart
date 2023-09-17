import 'package:flutter/material.dart';
import 'package:telcellwallet_clone/helpers/colors.dart';
import 'package:telcellwallet_clone/pages/selected_payments_page.dart';
import 'package:telcellwallet_clone/pages/services_page.dart';
import 'package:telcellwallet_clone/pages/special_offers_page.dart';

class HomeTabPage extends StatefulWidget {
  const HomeTabPage({super.key});

  @override
  State<HomeTabPage> createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage> {
  bool isvisibility = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        appBar: AppBar(
          backgroundColor: AppColors.bgColor,
          elevation: 0,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'ԳՈՌ',
                    style: TextStyle(
                        color: AppColors.appBlack,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.chevron_right_outlined, color: AppColors.appBlack)
                ],
              ),
              Text(
                'էքսպերտ',
                style: TextStyle(color: AppColors.appBlack, fontSize: 10),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_outlined,
                color: AppColors.appBlack,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: AppColors.appBlack,
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
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const ServicesPage(),
                          ));
                    },
                    child: const Text('դիտել բոլորը'))
              ],
            ),
            services(),
            selectedPayments(),
            const SpecialOffers()
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
                          backgroundColor: AppColors.appOrange,
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
          proposalItem(
              title: 'Տրանսպորտ',
              subtitle: 'Ուղետոմսեր',
              bgColor: const Color(0xff22C1A3),
              imageURL:
                  'https://freepngimg.com/thumb/car/3-2-car-free-download-png-thumb.png',
              onTap: () {}),
          proposalItem(
              title: 'Իվենթներ',
              bgColor: const Color(0xffA48DC0),
              imageURL:
                  'https://www.esri.com/content/dam/esrisites/en-us/about/events/infrastructure-management-and-gis-conference/2023/imgis23-banner-large-fg.png',
              onTap: () {}),
          proposalItem(
              title: 'Տերմինալից',
              subtitle: 'համալրված',
              bgColor: const Color(0xffD75535),
              imageURL:
                  'https://www.pngmart.com/files/6/Transport-PNG-Photos.png',
              onTap: () {}),
          proposalItem(
              title: 'Վարկ',
              subtitle: 'Մեքենայի գրավադրմամբ',
              bgColor: const Color(0xff9778B7),
              imageURL: '',
              onTap: () {}),
          proposalItem(
              title: 'Զգոնությունդ',
              bgColor: const Color(0xff22C1A3),
              imageURL: '',
              onTap: () {}),
          proposalItem(
              title: '', bgColor: Colors.cyan, imageURL: '', onTap: () {}),
          proposalItem(
              title: '', bgColor: Colors.yellow, imageURL: '', onTap: () {}),
        ],
      ),
    );
  }

  Widget proposalItem({
    required String title,
    String? subtitle,
    required void Function() onTap,
    required Color bgColor,
    required String imageURL,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 120,
        margin: const EdgeInsets.only(top: 15, right: 15),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: bgColor),
        child: Stack(
          children: [
            if (imageURL.isNotEmpty)
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.network(
                  imageURL,
                  fit: BoxFit.contain,
                ),
              ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                if (subtitle != null)
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget services() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          servicesItem(Icons.credit_card, 'Վճարումներ'),
          servicesItem(Icons.swap_horiz, 'Փոխանցում'),
          servicesItem(Icons.directions_bus_filled_outlined, 'Տրանսպորտ'),
          servicesItem(Icons.add_card_outlined, 'Վարկավորում'),
          servicesItem(Icons.celebration_outlined, 'Միջոցառումներ'),
          servicesItem(Icons.handshake_outlined, 'Գոռծընկերներ'),
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
          height: 90,
          width: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.grey[100]),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  icon,
                  size: 30,
                  color: AppColors.appOrange,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget selectedPayments() {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Text(
            'Ընտրված',
            style: TextStyle(fontSize: 17),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) =>
                      const SelectedPaymentsPage(),
                ),
              );
            },
            child: const Text('դիտել բոլոռը'),
          )
        ]),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              InkWell(
                excludeFromSemantics: true,
                onTap: (() {
                  showModalBottomSheet(
                      backgroundColor: const Color.fromARGB(0, 54, 87, 2),
                      context: context,
                      builder: (BuildContext buildContext) {
                        return _bottomSheet();
                      });
                }),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  height: 80,
                  width: 80,
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(50)),
                        child: const Icon(
                          Icons.add,
                          size: 25,
                        ),
                      ),
                      const Text(
                        'Ավելացնել',
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                ),
              ),
              selectedPaymentsItem(
                'ՄՏՍ Հայ hgffhgf',
                'https://download.logo.wine/logo/MTS_(network_provider)/MTS_(network_provider)-Logo.wine.png',
              ),
              selectedPaymentsItem(
                'ՄՏՍ Հայ',
                'https://download.logo.wine/logo/MTS_(network_provider)/MTS_(network_provider)-Logo.wine.png',
              ),
              selectedPaymentsItem(
                'ՄՏՍ Հայ',
                'https://download.logo.wine/logo/MTS_(network_provider)/MTS_(network_provider)-Logo.wine.png',
              ),
              selectedPaymentsItem(
                'ՄՏՍ Հայ',
                'https://download.logo.wine/logo/MTS_(network_provider)/MTS_(network_provider)-Logo.wine.png',
              ),
              selectedPaymentsItem(
                'ՄՏՍ Հայ',
                'https://download.logo.wine/logo/MTS_(network_provider)/MTS_(network_provider)-Logo.wine.png',
              ),
              selectedPaymentsItem(
                'ՄՏՍ Հայ ',
                'https://download.logo.wine/logo/MTS_(network_provider)/MTS_(network_provider)-Logo.wine.png',
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget selectedPaymentsItem(String text, String url) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: SizedBox(
          height: 80,
          width: 70,
          child: Column(
            children: [
              Image.network(
                url,
              ),
              const Expanded(child: SizedBox()),
              Text(
                text,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottomSheet() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25), color: Colors.white),
      height: 220,
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Նոր ընտրված  վճարում',
            style: TextStyle(fontSize: 20),
          ),
          Padding(
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
                      Icons.favorite_border,
                      color: AppColors.appOrange,
                    ),
                    const Text('   Ընտրված վճարումներ'),
                    const Expanded(child: SizedBox()),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
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
                        Icons.favorite_border,
                        color: AppColors.appOrange,
                      ),
                      const Text('   Խբային վճարումներ'),
                      const Expanded(child: SizedBox()),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      )
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
