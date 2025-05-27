import 'package:get/get.dart';
import 'package:pbrs_mart/network/api_service.dart';

class MainBannerController extends GetxController {
  final ApiService _apiService = ApiService();

  var banners = <Map<String, dynamic>>[].obs; // List of banner maps
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchBanners();
  }

  Future<void> fetchBanners() async {
    try {
      isLoading.value = true;

      final response = await _apiService.getMainBanner();

      if (response != null && response.statusCode == 200) {
        final responseData = response.data;

        if (responseData is Map<String, dynamic> &&
            responseData['return'] == true) {
          final List<dynamic> dataList = responseData['data'];

          // Convert List<dynamic> to List<Map<String, dynamic>>
          banners.value =
              dataList.map((e) => e as Map<String, dynamic>).toList();
        } else {
          Get.snackbar('Error', 'API returned false or unexpected data');
        }
      } else {
        Get.snackbar('Error', 'Failed to fetch banners');
      }
    } catch (e) {
      print('Banner fetch error: $e');
      Get.snackbar('Error', 'Exception during banner fetch');
    } finally {
      isLoading.value = false;
    }
  }

  // Helper to get full image URL
  String getImageUrl(int index) {
    if (index >= 0 && index < banners.length) {
      final relativePath = banners[index]['image'] as String;
      return 'https://pbrsmart.com/public$relativePath'; // prepend your domain
    }
    return '';
  }
}
