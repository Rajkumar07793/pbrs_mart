import 'package:flutter/material.dart';

class AddCounterButton extends StatefulWidget {
  const AddCounterButton({super.key});

  @override
  State<AddCounterButton> createState() => _AddCounterButtonState();
}

class _AddCounterButtonState extends State<AddCounterButton> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return quantity == 0
        ? Center(
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                quantity = 1;
              });
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            child: const Text("ADD", style: TextStyle(color: Colors.white)),
          ),
        )
        : Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.orange.withAlpha((.2 * 255).round()),
                  ),
                  child: Icon(Icons.remove, color: Colors.orange, size: 10),
                ),
                onPressed: () {
                  setState(() {
                    quantity--;
                  });
                },
              ),
              Text(
                quantity.toString(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              IconButton(
                icon: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.orange.withAlpha((.2 * 255).round()),
                  ),
                  child: Icon(Icons.add, color: Colors.orange, size: 10),
                ),
                onPressed: () {
                  setState(() {
                    quantity++;
                  });
                },
              ),
            ],
          ),
        );
  }
}
