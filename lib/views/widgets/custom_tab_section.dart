import 'package:faker/faker.dart' show Faker;
import 'package:flutter/material.dart';

class TabSection extends StatefulWidget {
  const TabSection({super.key});

  @override
  State<TabSection> createState() => _TabSectionState();
}

class _TabSectionState extends State<TabSection>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<bool> _isLoading = [false, true, true];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      int index = _tabController.index;
      if (_isLoading[index]) {
        setState(() {
          _isLoading[index] = false;
        });
        // Simulate delay for loading
        Future.delayed(const Duration(seconds: 2), () {
          setState(() {});
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          labelColor: Colors.deepPurple,
          unselectedLabelColor: Colors.grey,
          tabs: const [
            Tab(text: 'Services'),
            Tab(text: 'Grocery'),
            Tab(text: 'Agriculture'),
          ],
        ),
        SizedBox(
          height: 175,
          child: TabBarView(
            controller: _tabController,
            children: List.generate(3, (index) {
              if (_isLoading[index]) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return _buildTabContent(
                  index == 0
                      ? 'Service Main Category'
                      : index == 1
                      ? 'Grocery Items'
                      : 'Agricultural Products',
                );
              }
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildTabContent(String title) {
    final faker = Faker();
    return Row(
      children: [
        SizedBox(
          width: 130,
          child: Card(
            color: Colors.cyan.shade100,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipOval(
                    child: Image.network(
                      faker.image.image(keywords: ['grocery'], random: true),
                      height: 100,
                      width: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    faker.company.name(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
