import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBarController extends GetxController {
  var isSearching = false.obs;
  final TextEditingController searchController = TextEditingController();

  void toggleSearch() {
    isSearching.value = !isSearching.value;
    if (!isSearching.value) {
      searchController.clear();
    }
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
