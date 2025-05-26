import 'package:flutter/material.dart';
import 'package:pbrs_mart/views/cart/my_cart_screen.dart';
import 'package:pbrs_mart/views/widgets/custom_elevated_button.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const CustomAppBar({super.key, required this.scaffoldKey});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.menu, color: Colors.black),
        onPressed: () {
          widget.scaffoldKey.currentState?.openDrawer();
        },
      ),
      title:
          isSearching
              ? TextField(
                controller: _searchController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.grey[400]),
                ),
                style: const TextStyle(color: Colors.black),
                cursorColor: Colors.black,
              )
              : const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi, User',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'What would you like to have today',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
      actions: [
        if (isSearching)
          IconButton(
            icon: const Icon(Icons.close, color: Colors.black),
            onPressed: () {
              setState(() {
                isSearching = false;
                _searchController.clear();
              });
            },
          )
        else
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {
              setState(() {
                isSearching = true;
              });
            },
          ),
        if (!isSearching) ...[
          IconButton(
            icon: const Icon(Icons.location_pin, color: Colors.pink),
            onPressed: () {
              showLocationPopUp(context, _searchController);
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.orange),
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => MyCartScreen()));
            },
          ),
        ],
      ],
    );
  }
}

void showLocationPopUp(BuildContext ctx, TextEditingController controller) {
  showDialog(
    context: ctx,
    builder:
        (ctx) => AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            'PBRS Mart',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontFamily: 'Cursive',
            ),
            textAlign: TextAlign.center,
          ),
          actions: [
            Align(
              alignment: Alignment.center,
              child: CustomElevatedButton(
                height: 50,
                width: double.infinity,
                onPressed: () {
                  Navigator.pop(ctx);
                },
                title: 'Search Now',
              ),
            ),
          ],

          content: SizedBox(
            height: 70,
            child: TextField(
              controller: controller,

              decoration: InputDecoration(
                hintText: "Search Your Pincode Here",
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
  );
}
