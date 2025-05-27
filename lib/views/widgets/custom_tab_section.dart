import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/component_controllers/tab_controller.dart';
import '../../models/type_model.dart';

class TabSection extends StatelessWidget {
  const TabSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Use Get.put only once at the top level (not inside build again and again)
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
              height: 195,
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
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.68,
      ),
      itemCount: 3,
      itemBuilder:
          (context, index) => CategoryCard(
            title: type.name,
            imageUrl: 'https://pbrsmart.com${type.image}',
          ),
    );
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
