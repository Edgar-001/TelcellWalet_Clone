import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SpecialOffers extends StatefulWidget {
  const SpecialOffers({super.key});

  @override
  State<SpecialOffers> createState() => _SpecialOffersState();
}

class _SpecialOffersState extends State<SpecialOffers> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Հատուկ առաջարկներ',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
        SizedBox(
          width: double.infinity,
          height: 130,
          child: CarouselSlider(items: [
            card(
                'https://imageio.forbes.com/specials-images/imageserve/5d35eacaf1176b0008974b54/0x0.jpg?format=jpg&crop=4560,2565,x790,y784,safe&width=1200',
                nameCar: 'Chevrolet Corvette Stingray'),
            card(
                'https://images.drive.com.au/driveau/image/upload/t_wp-default/v1/cms/uploads/jjslyagf8e3gcny2doyy',
                nameCar: 'McLaren Solus GT'),
            card(
                'https://www.mercedes-benz.co.in/content/india/en/passengercars/_jcr_content/root/responsivegrid/simple_teaser_115569/simple_teaser_item_469564746.component.damq2.3375083919065.png/simple_teaser_a_45.png',
                nameCar: 'Mercedes Benz'),
            card(
                'https://i.pinimg.com/736x/d7/e7/1d/d7e71d7cff632d43cc1895ee2509d2e1.jpg',
                nameCar: 'BMW'),
          ], options: CarouselOptions(autoPlay: true, viewportFraction: 0.6)),
        )
      ],
    );
  }

  Widget card(String image, {String? nameCar}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(children: [
          Image.network(
            image,
            width: 220,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                nameCar ?? '',
                style: const TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
