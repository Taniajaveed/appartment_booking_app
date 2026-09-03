import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        //color: Colors.white
        color: Theme.of(context).colorScheme.surface,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(icon: Icons.home_rounded, index: 0),

          _navItem(icon: Icons.grid_view_outlined, index: 1),

          _navItem(icon: Icons.bookmark_border_rounded, index: 2),

          _navItem(icon: Icons.person_outline_rounded, index: 3),
        ],
      ),
    );
  }

  Widget _navItem({required IconData icon, required int index}) {
    final bool isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 60,
        height: 70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 25,
              color: isSelected
                  ? const Color(0xFF8956E8)
                  : const Color(0xFFB8C5F5),
            ),

            const SizedBox(height: 8),

            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected
                    ? const Color(0xFF8956E8)
                    : Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
