// ignore_for_file: deprecated_member_use

import 'package:carousel_slider/carousel_slider.dart';
import 'package:faker/faker.dart' hide Image;
import 'package:flutter/material.dart';
import 'package:pbrs_mart/views/widgets/custom_tab_section.dart';
import 'package:pbrs_mart/views/widgets/offer_zone.dart';

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
