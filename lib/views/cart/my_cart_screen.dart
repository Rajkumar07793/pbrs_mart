import 'package:faker/faker.dart' as fake;
import 'package:flutter/material.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final faker = fake.Faker();
    final List<CartItem> cartItems = [
      CartItem(
        name: "Rin Detergent Bar,",
        price: 5,
        quantity: 1,
        unit: "75 Gram",
        image: faker.image.loremPicsum(),
      ),
      CartItem(
        name: "Engage On Pocket Perfume - Woman, Cool Aqua,",
        price: 60,
        quantity: 5,
        unit: "18 ML",
        image: faker.image.loremPicsum(),
      ),
      CartItem(
        name: "Lifebuoy Total 10 Soap Bar, 8x125 g Multipack",
        price: 130,
        quantity: 2,
        unit: "500 Gram",
        image: faker.image.loremPicsum(),
      ),
      CartItem(
        name:
            "Lifebuoy Total 10 Activ Naturo Germ Protection Handwash Refill, 3x750 ml (Multipack)",
        price: 119,
        quantity: 1,
        unit: "750 ML",
        image: faker.image.loremPicsum(),
      ),
      CartItem(
        name: "Engage L'Amante Intensity Eau De Parfum - Perfume For Women,",
        price: 999,
        quantity: 1,
        unit: "100 ML",
        image: faker.image.loremPicsum(),
      ),
    ];

    return Scaffold(
      // backgroundColor: Color(0xFFF8F9FB),
      appBar: AppBar(
        // backgroundColor: Colors.purple,
        title: Text(
          "My Cart",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        // leading: BackButton(),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return CartItemWidget(item: item);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  // backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Text("Checkout", style: TextStyle(fontSize: 18)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CartItem {
  final String name;
  final int price;
  final int quantity;
  final String unit;
  final String image;

  CartItem({
    required this.name,
    required this.price,
    required this.quantity,
    required this.unit,
    required this.image,
  });
}

class CartItemWidget extends StatelessWidget {
  final CartItem item;

  const CartItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final total = item.price * item.quantity;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(item.image, height: 60, width: 60, fit: BoxFit.contain),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.name, style: TextStyle(fontWeight: FontWeight.w600)),
                Text(
                  "₹${item.price}/${item.unit}",
                  style: TextStyle(color: Colors.grey[700]),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    QuantityButton(icon: Icons.remove),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        item.quantity.toString(),
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    QuantityButton(icon: Icons.add),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("SGST : ₹0", style: TextStyle(fontSize: 12)),
              Text("CGST : ₹0", style: TextStyle(fontSize: 12)),
              Text(
                "Total : ₹$total",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class QuantityButton extends StatelessWidget {
  final IconData icon;

  const QuantityButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: Colors.orange[100],
        borderRadius: BorderRadius.circular(6),
      ),
      child: Icon(icon, color: Colors.orange, size: 20),
    );
  }
}
