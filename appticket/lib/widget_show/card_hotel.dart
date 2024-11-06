import 'package:flutter/material.dart';

class CardHotel extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final String review;
  final String price;

  const CardHotel({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.review,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 300,
      child: Card(
        elevation: 7,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  width: double.infinity,
                  height: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                child: ListTile(
                  title: Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(subtitle),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        for (int i = 0; i < int.parse(review); i++)
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 14,
                          ),
                      ],
                    ),
                    Text(
                      price,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final List<Map<String, String>> hotels = [
  {
    "image": "assets/images/hotelImages/hotel1.png",
    "title": "Orange Hotel",
    "subtitle": "Don't forget our place",
    "review": "3",
    "price": "100\$/night",
  },
  {
    "image": "assets/images/hotelImages/hotel2.png",
    "title": "King Hotel",
    "subtitle": "The best place for enjoy",
    "review": "5",
    "price": "200\$/night",
  },
  {
    "image": "assets/images/hotelImages/hotel3.png",
    "title": "Hotel MR",
    "subtitle": "Clean, Secure, and Good Quality",
    "review": "3",
    "price": "110\$/night",
  },
  {
    "image": "assets/images/hotelImages/hotel4.png",
    "title": "Gold Hotel",
    "subtitle": "The best place for trips",
    "review": "4",
    "price": "100\$/night",
  },
];
