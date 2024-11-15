import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../pages_controllers/factory_automation_page_controller.dart';
import '../../settings/assets_file.dart';

class Pomp extends StatelessWidget {
  const Pomp({
    super.key,
    required this.controller,
  });

  final FactoryAutomationPageController controller;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => controller.isHovered = true,
      onExit: (event) => controller.isHovered = false,
      child: GestureDetector(
        onTap: () {
          // Change pump condition
          controller.togglePump();
        },
        child: AnimatedScale(
          scale: controller.isHovered ? 1.1 : 1.0, // Scale animation on hover
          duration: const Duration(milliseconds: 200),
          child: Tooltip(
            message: controller.isPumpOn
                ? "ポンプ状態: ON\n(クリックしてOFFにする)"
                : "ポンプ状態: OFF\n(クリックしてONにする)",
            preferBelow: true,
            verticalOffset: Get.height * .075,
            child: Image.asset(
              controller.isPumpOn ? pngPompActive : pngPompNotActive,
              height: Get.height * .15,
              width: Get.width * .15,
            ),
          ),
        ),
      ),
    );
  }
}
