import 'package:faker/faker.dart' hide Image;
import 'package:flutter/material.dart';
import 'package:pbrs_mart/views/dashboard/my_cart_screen.dart';
import 'package:pbrs_mart/views/widgets/add_counter_button.dart';
import 'package:pbrs_mart/views/widgets/custom_dropdown.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Product Details',
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.orange),
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => MyCartScreen()));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Product Header Sections
            ProductHeader(
              imageUrl: faker.image.loremPicsum(),
              title: faker.company.name(),
              volumes: ["2250\nML", "750\nML"],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Details",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Product Details Section
            ProductDetailsSection(
              title: faker.company.name(),
              description: faker.lorem.words(100).join(' '),
            ),

            const SizedBox(height: 24),

            // Related Products Section
            RelatedProductsSection(
              title: faker.company.name(),
              imageUrl: faker.image.loremPicsum(),
            ),

            AddCounterButton(),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// Reusable Product Header Component
class ProductHeader extends StatelessWidget {
  final String title;
  final String imageUrl;
  final List<String> volumes;

  const ProductHeader({
    super.key,
    required this.title,
    required this.volumes,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.grey.shade200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 250,
              width: 250,
              child: Image.network(imageUrl),
            ),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 8),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
                volumes.map((volume) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Container(
                      alignment: Alignment.center,
                      height: 75,
                      width: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        color: Colors.white,
                      ),
                      child: Text(
                        volume,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                  );
                }).toList(),
          ),
          SizedBox(height: 10),
          AddCounterButton(),
        ],
      ),
    );
  }
}

// Reusable Product Details Component
class ProductDetailsSection extends StatelessWidget {
  final String title;
  final String description;

  const ProductDetailsSection({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Divider(),
          const SizedBox(height: 12),
          Text('About the Product', style: TextStyle(fontSize: 22)),
          const SizedBox(height: 12),

          Text(
            description,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}

// Reusable Related Products Component
class RelatedProductsSection extends StatefulWidget {
  final String title;
  final String imageUrl;

  const RelatedProductsSection({
    super.key,
    required this.title,
    required this.imageUrl,
  });

  @override
  State<RelatedProductsSection> createState() => _RelatedProductsSectionState();
}

class _RelatedProductsSectionState extends State<RelatedProductsSection> {
  String selectedValue = "Select Variant";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.deepPurpleAccent.withAlpha((.1 * 255).round()),
            width: double.infinity,
            padding: EdgeInsets.all(8),
            child: const Text(
              'Related Products',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 200,
              width: 200,
              child: Image.network(widget.imageUrl),
            ),
          ),
          Container(
            width: double.infinity,
            height: 25,
            decoration: BoxDecoration(
              color: Colors.orange.shade100,
              borderRadius: BorderRadius.circular(5),
            ),
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
            child: const Text(
              'Supplier - Super Admin',
              style: TextStyle(fontSize: 10, color: Colors.black),
            ),
          ),
          Text(
            widget.title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14),
          ),
          CustomDropdown(
            value: selectedValue,
            items: ["Select Variant", "₹999.00/100 ML", "₹1999.00/200 ML"],
            onChanged: (v) {
              setState(() {
                selectedValue = v ?? "Select Variant";
              });
            },
          ),
        ],
      ),
    );
  }
}
