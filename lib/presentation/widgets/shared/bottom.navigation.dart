import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return BottomNavigationBar(
        elevation: 0,
        backgroundColor: colors.primaryContainer,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_max), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.label_outline), label: 'Categorías'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_outline), label: 'Favoritos')
        ]);
  }
}
