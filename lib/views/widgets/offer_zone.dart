import 'package:faker/faker.dart' hide Image;
import 'package:flutter/material.dart';
import 'package:pbrs_mart/views/dashboard/product_detail.dart';
import 'package:pbrs_mart/views/widgets/add_counter_button.dart';

class OfferZone extends StatefulWidget {
  const OfferZone({super.key});

  @override
  State<OfferZone> createState() => _OfferZoneState();
}

class _OfferZoneState extends State<OfferZone> {
  Map<int, String> selectedVariants = {};

  @override
  void initState() {
    super.initState();
    // Initialize with default value for example for 3 cards
    selectedVariants = {
      0: "Select Variant",
      1: "Select Variant",
      2: "Select Variant",
    };
  }

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
          children: List.generate(productData.length, (index) {
            final product = productData[index];
            return _buildOfferCard(index, product['title']!, product['image']!);
          }),
        ),
      ],
    );
  }

  Widget _buildOfferCard(int index, String title, String imageUrl) {
    String selectedValue = selectedVariants[index] ?? "Select Variant";

    return InkWell(
      onTap: () {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (_) => ProductDetailScreen()));
      },
      child: Card(
        elevation: 0,
        child: Column(
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
                color: Colors.yellow.shade100,
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
            DropdownButton<String>(
              value: selectedValue,
              items:
                  ["Select Variant", "₹999.00/100 ML", "₹1999.00/200 ML"]
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
              style: TextStyle(fontSize: 12, color: Colors.black),
              onChanged: (v) {
                setState(() {
                  selectedVariants[index] = v ?? "Select Variant";
                });
              },
            ),
            AddCounterButton(),

            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
