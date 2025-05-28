import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pbrs_mart/network/api_service.dart';
import '../../controllers/component_controllers/tab_controller.dart';
import '../../models/type_model.dart';

class TabSection extends StatelessWidget {
  const TabSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TabSectionController());
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      return DefaultTabController(
        length: controller.tabItems.length,
        child: Column(
          children: [
            TabBar(
              labelColor: Colors.deepPurple,
              unselectedLabelColor: Colors.grey,
              isScrollable: true,
              tabs:
                  controller.tabItems
                      .map((item) => Tab(text: item.name))
                      .toList(),
            ),
            SizedBox(
              height: 200,
              child: TabBarView(
                children:
                    controller.tabItems.map((item) {
                      return _buildTabContent(item);
                    }).toList(),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildTabContent(TypeModel type) {
    final TabSectionController controller = Get.find();

    if (!controller.categoryMap.containsKey(type.slug)) {
      controller.fetchCategoriesForSlug(type.slug);
    }

    return Obx(() {
      final categories = controller.categoryMap[type.slug];

      if (categories == null) {
        return const Center(child: CircularProgressIndicator());
      }

      if (categories.isEmpty) {
        return const Center(child: Text('No categories found'));
      }

      return GridView.builder(
        physics: ScrollPhysics(),
        shrinkWrap: false,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.68,
        ),

        itemCount: categories.length,
        itemBuilder: (context, index) {
          final item = categories[index];

          // Find English name
          final List names = item['names'] ?? [];
          final englishName = names.firstWhere(
            (n) => n['language_id'] == 2,
            orElse: () => null,
          );
          final title =
              englishName != null
                  ? englishName['name'] ?? 'No name'
                  : 'No name';

          // Get image
          final imagePath = item['image'] ?? '';

          return CategoryCard(
            title: title,
            imageUrl: '${ApiService.baseUrlImage}$imagePath',
          );
        },
      );
    });
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final String imageUrl;

  const CategoryCard({super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      child: Card(
        color: Colors.cyan.shade100,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ClipOval(
                child: Image.network(
                  imageUrl,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                  errorBuilder:
                      (context, error, stackTrace) =>
                          const Icon(Icons.broken_image),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
