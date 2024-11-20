import 'package:flutter/material.dart';
import 'task_manager_page.dart';
import 'calendar_page.dart';
import 'statistics_page.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/side_menu.dart';

class DashboardPage extends StatefulWidget {
  final String username;
  const DashboardPage({super.key, required this.username});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Center(
        child: Text("Home Page")), // Home page bisa diubah sesuai keinginan
    const TaskManagerPage(),
    const CalendarPage(),
    const StatisticsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Menambahkan gradient pada AppBar
        toolbarHeight: 100, // Ukuran toolbar
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.pink.shade500, Colors.pink.shade300],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, ${widget.username}!',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 5),
            const Text(
              'TaskFlow Dashboard',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      drawer: const SideMenu(),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigation(
        initialIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
