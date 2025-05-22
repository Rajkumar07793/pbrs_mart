import 'package:flutter/material.dart';

Drawer buildAppDrawer() {
  return Drawer(
    backgroundColor: Color(0xFFF9F4FC),
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        SizedBox(
          height: 250,
          child: DrawerHeader(
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/ic_prbs_3.png', // Replace with your logo asset path
                  height: 100,
                ),
                Text(
                  'Welcome Prashant Patel',
                  style: TextStyle(
                    fontSize: 16,
                    // color: Colors.black87
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Handle logout
                  },
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      // color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        _buildDrawerItem('My Profile', 'assets/images/ic_myprofile.png'),
        _buildDrawerItem('Change Language', 'assets/images/ic_myprofile.png'),
        _buildDrawerItem('Orders', 'assets/images/ic_cart.png'),
        _buildDrawerItem('Help & Support', 'assets/images/ic_help.png'),
        _buildDrawerItem('About Us', 'assets/images/ic_about_us.png'),
        _buildDrawerItem(
          'Delivery Information',
          'assets/images/ic_delivery.png',
        ),
        _buildDrawerItem('Privacy Policy', 'assets/images/ic_privacy.png'),
        _buildDrawerItem('Terms & Conditions', 'assets/images/ic_term.png'),
        _buildDrawerItem('Share App', 'assets/images/ic_share.png'),
      ],
    ),
  );
}

Widget _buildDrawerItem(String title, String iconPath) {
  return ListTile(
    leading: Image.asset(iconPath, height: 28, width: 28),
    title: Text(title),
    onTap: () {
      // Add navigation or action here
    },
  );
}
