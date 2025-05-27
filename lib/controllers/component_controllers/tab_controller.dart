import 'package:get/get.dart';
import 'package:pbrs_mart/network/api_service.dart';
import '../../models/type_model.dart';

class TabSectionController extends GetxController {
  final ApiService _apiService = ApiService();

  var isLoading = true.obs;
  var tabItems = <TypeModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchTabData();
  }

  void fetchTabData() async {
    final response = await _apiService.getUserTypes();
    if (response != null && response.statusCode == 200) {
      final List data = response.data['data'];
      tabItems.value = data.map((e) => TypeModel.fromJson(e)).toList();
    }
    isLoading.value = false;
  }
}
