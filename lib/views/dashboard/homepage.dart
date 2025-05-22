// ignore_for_file: deprecated_member_use

import 'package:carousel_slider/carousel_slider.dart';
import 'package:faker/faker.dart' hide Image;
import 'package:flutter/material.dart';

import 'package:pbrs_mart/views/widgets/custom_tab_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final faker = Faker();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              faker.image.image(keywords: ['grocery'], random: true),
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            const TabSection(),
            const SizedBox(height: 20),
            CarouselSlider(
              items:
                  [
                    faker.image.image(keywords: ['grocery'], random: true),
                    faker.image.image(keywords: ['agriculture'], random: true),
                  ].map((url) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Image.network(
                          url,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        );
                      },
                    );
                  }).toList(),
              options: CarouselOptions(
                height: 180.0,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 1.0,
              ),
            ),
            const SizedBox(height: 20),
            const OfferZone(),
          ],
        ),
      ),
    );
  }
}

class OfferZone extends StatelessWidget {
  const OfferZone({super.key});

  @override
  Widget build(BuildContext context) {
    final productData = [
      {
        'title': 'Lifebuoy Total 10 Soap Bar, 8x125g Multipack',
        'image': faker.image.image(keywords: ['grocery'], random: true),
      },
      {
        'title': 'Lifebuoy Total 10 Handwash, 3x750ml',
        'image': faker.image.image(keywords: ['grocery'], random: true),
      },
      {
        'title': 'Lifebuoy Total 10 Handwash, 3x750ml',
        'image': faker.image.image(keywords: ['grocery'], random: true),
      },
      {
        'title': 'Another Grocery Item',
        'image': faker.image.image(keywords: ['grocery'], random: true),
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Offer Zone',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: 0.6,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children:
              productData.map((product) {
                return _buildOfferCard(product['title']!, product['image']!);
              }).toList(),
        ),
      ],
    );
  }

  Widget _buildOfferCard(String title, String imageUrl) {
    return Container(
      width: 160,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(imageUrl, height: 120, fit: BoxFit.cover),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Supplier - Super Admin',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(title, maxLines: 2, overflow: TextOverflow.ellipsis),
            ),

            SizedBox(height: 10),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 120,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrangeAccent,
                  ),
                  child: Text(
                    'ADD',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
