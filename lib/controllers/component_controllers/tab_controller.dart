import 'package:get/get.dart';
import 'package:pbrs_mart/models/type_model.dart';
import 'package:pbrs_mart/network/api_service.dart';

class TabSectionController extends GetxController {
  var isLoading = true.obs;
  var tabItems = <TypeModel>[];

  // This will store fetched categories for each slug
  var categoryMap = <String, List<dynamic>>{}.obs;

  @override
  void onInit() {
    fetchUserTypes(); // fetch tab items
    super.onInit();
  }

  void fetchUserTypes() async {
    final response = await ApiService().getUserTypes();
    if (response != null && response.statusCode == 200) {
      final List list = response.data['data'];
      tabItems = list.map((e) => TypeModel.fromJson(e)).toList();
    }
    isLoading.value = false;
  }

  Future<void> fetchCategoriesForSlug(String slug) async {
    if (categoryMap.containsKey(slug)) return; // prevent re-fetch

    final response = await ApiService().fetchMainCategoryBySlug(slug);
    if (response != null && response.statusCode == 200) {
      final data = response.data['data'];
      if (data is List) {
        categoryMap[slug] = data;
      } else {
        categoryMap[slug] = [];
      }
    } else {
      categoryMap[slug] = [];
    }
  }
}
