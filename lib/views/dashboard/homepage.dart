// ignore_for_file: deprecated_member_use

import 'package:carousel_slider/carousel_slider.dart';
import 'package:faker/faker.dart' hide Image;
import 'package:flutter/material.dart';
import 'package:pbrs_mart/core/constants/colors.dart';
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
        'title': faker.food.dish(),
        'image': faker.image.image(
          keywords: ['products', 'soap'],
          random: true,
        ),
      },
      {
        'title': faker.food.dish(),
        'image': faker.image.image(
          keywords: ['products', 'grocery'],
          random: true,
        ),
      },
      {
        'title': faker.food.dish(),
        'image': faker.image.image(
          keywords: ['products', 'soap'],
          random: true,
        ),
      },
      {
        'title': faker.food.dish(),
        'image': faker.image.image(
          keywords: ['products', 'electronic'],
          random: true,
        ),
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
          childAspectRatio: 0.7,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          children:
              productData.map((product) {
                return _buildOfferCard(product['title']!, product['image']!);
              }).toList(),
        ),
      ],
    );
  }

  Widget _buildOfferCard(String title, String imageUrl) {
    String selectedValue = "Select Variant";
    return Card(
      elevation: 0,
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.network(imageUrl, height: 120, fit: BoxFit.cover),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.lightYellow,
              borderRadius: BorderRadius.circular(5),
            ),
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
            child: Text(
              'Supplier - Super Admin',
              style: TextStyle(fontSize: 10, color: Colors.black),
            ),
          ),
          Text(title, maxLines: 2, overflow: TextOverflow.ellipsis),

          DropdownButton(
            value: selectedValue,
            items:
                ["Select Variant", "₹999.00/100 ML", "₹1999.00/200 ML"]
                    .map((e) => DropdownMenuItem(value: e, child: Text("$e")))
                    .toList(),
            onChanged: (v) {
              selectedValue = v ?? "";
            },
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.orange),
            child: Text(
              'ADD',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
