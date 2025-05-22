import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pbrs_mart/views/dashboard/homepage.dart';
import 'package:pbrs_mart/views/dashboard/order_screen.dart';
import 'package:pbrs_mart/views/dashboard/second_screen.dart';
import 'package:pbrs_mart/views/dashboard/service_screen.dart';
import 'package:pbrs_mart/views/widgets/custom_app_bar.dart';
import 'package:pbrs_mart/views/widgets/custom_drawer.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    SecondScreen(),
    Container(),
    OrderScreen(),
    ServiceScreen(),
    // ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: CustomAppBar(scaffoldKey: scaffoldKey),
      drawer: buildAppDrawer(),
      body: _screens[_selectedIndex],
      floatingActionButton: SizedBox(
        height: 65,
        width: 65,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            elevation: 5,
            backgroundColor: Colors.deepPurpleAccent.withAlpha(
              (.5 * 255).round(),
            ),
            alignment: Alignment.center,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Icon(Icons.table_chart_sharp, size: 20, color: Colors.white54),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(0.1)),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: GNav(
              gap: 8,
              padding: const EdgeInsets.all(12),
              duration: const Duration(milliseconds: 300),
              tabBackgroundColor: Colors.deepOrange.shade100,
              color: Colors.grey[800],
              activeColor: Colors.deepOrange,
              iconSize: 24,
              tabs: [
                GButton(
                  icon: Icons.home,
                  onPressed: () => setState(() => _selectedIndex = 0),
                ),
                GButton(
                  icon: Icons.percent,
                  onPressed: () => setState(() => _selectedIndex = 1),
                ),
                GButton(icon: Icons.circle, iconColor: Colors.transparent),
                GButton(
                  icon: Icons.list_alt_rounded,
                  onPressed: () => setState(() => _selectedIndex = 2),
                ),
                GButton(
                  icon: Icons.wallet_giftcard_sharp,
                  onPressed: () => setState(() => _selectedIndex = 3),
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
