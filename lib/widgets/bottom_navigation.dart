import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final int initialIndex;
  final Function(int) onTap;

  const BottomNavigation({
    super.key,
    required this.initialIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: initialIndex,
      onTap: onTap,
      selectedItemColor: Colors.pink.shade600, // Warna pink untuk item yang dipilih
      unselectedItemColor: Colors.grey.shade600, // Warna abu-abu untuk item yang tidak dipilih
      showSelectedLabels: true, // Menampilkan label
      showUnselectedLabels: true, // Menampilkan label untuk item yang tidak dipilih
      selectedFontSize: 14, // Ukuran font item yang dipilih
      unselectedFontSize: 12, // Ukuran font item yang tidak dipilih
      backgroundColor: Colors.white, // Latar belakang BottomNavigationBar
      elevation: 8, // Memberikan efek bayangan pada BottomNavigationBar
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.task),
          label: 'Tasks',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: 'Calendar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bar_chart),
          label: 'Stats',
        ),
      ],
    );
  }
}
