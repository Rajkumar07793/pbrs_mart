import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pbrs_mart/controllers/component_controllers/custom_app_bar_controller.dart';
import 'package:pbrs_mart/core/utils/routes.dart';
import 'package:pbrs_mart/views/widgets/custom_elevated_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const CustomAppBar({super.key, required this.scaffoldKey});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final CustomAppBarController controller = Get.put(CustomAppBarController());
    return AppBar(
      titleSpacing: 0,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Column(
        children: [
          IconButton(
            onPressed: () => scaffoldKey.currentState?.openDrawer(),
            icon: Image.asset('assets/images/ic_menu.png', height: 40),
          ),
        ],
      ),
      title: Obx(() {
        return controller.isSearching.value
            ? TextField(
              controller: controller.searchController,
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
            );
      }),
      actions: [
        Obx(
          () =>
              controller.isSearching.value
                  ? IconButton(
                    icon: const Icon(Icons.close, color: Colors.black),
                    onPressed: controller.toggleSearch,
                  )
                  : IconButton(
                    icon: const Icon(Icons.search, color: Colors.black),
                    onPressed: controller.toggleSearch,
                  ),
        ),
        Obx(() {
          if (!controller.isSearching.value) {
            return Row(
              children: [
                IconButton(
                  visualDensity: VisualDensity.compact,
                  padding: EdgeInsets.zero,
                  icon: Image.asset(
                    'assets/images/ic_location.png',
                    height: 40,
                  ),
                  onPressed: () => showLocationPopUp(context, controller),
                ),
                IconButton(
                  visualDensity: VisualDensity.compact,
                  padding: EdgeInsets.zero,
                  icon: Image.asset('assets/images/ic_cart.png', height: 40),
                  onPressed: () => Get.toNamed(AppRoutes.myCart),
                ),
              ],
            );
          }
          return const SizedBox.shrink();
        }),
      ],
    );
  }
}

void showLocationPopUp(
  BuildContext context,
  CustomAppBarController controller,
) {
  showDialog(
    context: context,
    builder:
        (ctx) => AlertDialog(
          backgroundColor: Colors.white,
          title: const Text(
            'PBRS Mart',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontFamily: 'Cursive',
            ),
            textAlign: TextAlign.center,
          ),
          content: SizedBox(
            height: 70,
            child: TextField(
              controller: controller.searchController,
              decoration: const InputDecoration(
                hintText: "Search Your Pincode Here",
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          actions: [
            Align(
              alignment: Alignment.center,
              child: CustomElevatedButton(
                height: 50,
                width: double.infinity,
                onPressed: () => Navigator.pop(ctx),
                title: 'Search Now',
              ),
            ),
          ],
        ),
  );
}
