import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Header Menu dengan gradient warna dan animasi
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.pink.shade500, Colors.pink.shade300],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.task_alt_rounded,
                    color: Colors.white,
                    size: 40,
                  ),
                  SizedBox(width: 15),
                  Text(
                    'TaskFlow',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            // Settings Item dengan animasi dan transisi warna
            _buildMenuItem(
              context,
              icon: Icons.settings,
              title: 'Settings',
              onTap: () {
                // Tambahkan logika untuk navigasi
              },
            ),
            // About Item dengan efek transisi warna
            _buildMenuItem(
              context,
              icon: Icons.info,
              title: 'About',
              onTap: () {
                // Tambahkan logika untuk navigasi
              },
            ),
            Divider(),
            // Extra Space for neatness
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Widget untuk membuat setiap menu item
  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.pink.shade400,
        size: 30,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.pink.shade600,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
      tileColor: Colors.pink.shade50,
      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      visualDensity: VisualDensity.compact,
    );
  }
}
