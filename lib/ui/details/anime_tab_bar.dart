import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'details_controller.dart';

class AnimeTabBar extends StatelessWidget {
  const AnimeTabBar({super.key});

  final List<String> tabs = const ['Details', 'Reviews', 'Related', 'Activity'];

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DetailsController>();

    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(tabs.length, (index) {
          final isSelected = controller.selectedTab.value == index;
          return GestureDetector(
            onTap: () => controller.selectedTab.value = index,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:
                    isSelected
                        ? Colors.cyanAccent.shade400.withOpacity(0.2)
                        : Colors.transparent,
              ),
              child: Text(
                tabs[index],
                style: TextStyle(
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? Colors.cyanAccent : Colors.grey.shade400,
                  fontSize: 14,
                ),
              ),
            ),
          );
        }),
      );
    });
  }
}
