import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kd/pages_components/factory_automation_page/water_pipe_horizontal.dart';
import 'package:kd/pages_controllers/factory_automation_page_controller.dart';
import 'package:kd/settings/assets_file.dart';

class FactoryAutomationPage extends StatelessWidget {
  const FactoryAutomationPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Instantiate the ShareController
    final FactoryAutomationPageController controller =
        Get.put(FactoryAutomationPageController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("ポンプ Water Level"),
      ),
      body: Column(
        children: [
          const Center(
            child: Text("ポンプ監視システム"),
          ),
          SizedBox(
            width: Get.width,
            height: Get.height * 0.35,
            child: Stack(
              children: [
                // Pipe 1
                Positioned(
                    bottom: Get.height * .0625,
                    left: Get.width * .11,
                    child: const WaterPipeHorizontal()),

                // Pomp
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Obx(
                    () => MouseRegion(
                      onEnter: (event) => controller.isHovered = true,
                      onExit: (event) => controller.isHovered = false,
                      child: GestureDetector(
                        onTap: () {
                          // Change pump condition
                          controller.togglePump();
                        },
                        child: AnimatedScale(
                          scale: controller.isHovered
                              ? 1.3
                              : 1.0, // Scale animation on hover
                          duration: const Duration(milliseconds: 200),
                          child: Tooltip(
                            message: controller.isPumpOn
                                ? "ポンプ状態: ON\n(クリックしてOFFにする)"
                                : "ポンプ状態: OFF\n(クリックしてONにする)",
                            preferBelow: true,
                            verticalOffset: Get.height * .075,
                            child: Image.asset(
                              controller.isPumpOn
                                  ? pngPompActive
                                  : pngPompNotActive,
                              height: Get.height * .15,
                              width: Get.width * .15,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
            child: SizedBox(),
          ),
        ],
      ),
    );
  }
}
