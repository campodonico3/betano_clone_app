import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF83E05),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}

class CustomBottomNavigationBar extends StatefulWidget {
  @override
  _CustomBottomNavigationBarState createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      color: Colors.blueGrey.shade600,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(Icons.home, 'Inicio', 0),
          _buildNavItem(Icons.flash_on, 'En vivo', 1),
          _buildNavItem(Icons.sports_soccer, 'Deportes', 2),
          _buildNavItem(Icons.list_alt_outlined, 'Apuestas', 3),
          _buildNavItem(Icons.search, 'Explorar', 4),
          _buildNavItem(Icons.pie_chart, 'Stats', 5, isCircular: true),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index, {bool isCircular = false}) {
    bool isSelected = _selectedIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedIndex = index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(isCircular ? 8 : 0),
              decoration: isCircular ? BoxDecoration(
                color: Colors.deepOrangeAccent,
                shape: BoxShape.circle,
              ) : null,
              child: Icon(
                icon,
                color: isCircular ? Colors.white : (isSelected ? Colors.deepOrangeAccent : Colors.white),
                size: 24,
              ),
            ),
            SizedBox(height: 4),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                label,
                style: TextStyle(
                  color: isSelected ? Colors.deepOrangeAccent : Colors.white,
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}