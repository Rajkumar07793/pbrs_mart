// ignore_for_file: deprecated_member_use

import 'package:carousel_slider/carousel_slider.dart';
import 'package:faker/faker.dart' hide Image;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pbrs_mart/controllers/component_controllers/main_banner.dart';
import 'package:pbrs_mart/views/widgets/custom_tab_section.dart';
import 'package:pbrs_mart/views/widgets/offer_zone.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MainBannerController controller = Get.put(MainBannerController());

    final faker = Faker();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }
              if (controller.banners.isEmpty) {
                return Center(child: Text('No banners found'));
              }

              if (controller.banners.length == 1) {
                final imageUrl = controller.getImageUrl(0);
                return Image.network(imageUrl);
              } else {
                return SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.banners.length,
                    itemBuilder: (context, index) {
                      final imageUrl = controller.getImageUrl(index);
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Image.network(imageUrl),
                      );
                    },
                  ),
                );
              }
            }),
            const SizedBox(height: 10),
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
