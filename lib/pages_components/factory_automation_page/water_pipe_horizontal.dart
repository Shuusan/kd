import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../pages_controllers/factory_automation_page_controller.dart';

class WaterPipeHorizontal extends StatefulWidget {
  const WaterPipeHorizontal({super.key});

  @override
  State<WaterPipeHorizontal> createState() => _WaterPipeHorizontalState();
}

class _WaterPipeHorizontalState extends State<WaterPipeHorizontal>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this, // SingleTickerProviderStateMixin provides vsync
    )..repeat();

    _animation = Tween<double>(begin: 0.0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FactoryAutomationPageController>();

    return Container(
      width: Get.width * .15, // Length of the pipe
      height: Get.height * .020, // Thickness of the pipe
      decoration: BoxDecoration(
        color: Colors.grey, // Pipe color
        borderRadius: BorderRadius.circular(20), // Rounded edges
        border: Border.all(
          color: Colors.black, // Pipe border color
          width: 3, // Pipe border thickness
        ),
      ),

      // Water flow
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Obx(
          () => Visibility(
            visible: controller
                .isPumpOn, // Show water only if animating (pump is on)
            child: Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      // First water container
                      AnimatedBuilder(
                        animation: _animation,
                        builder: (context, child) {
                          return Positioned(
                            left: -Get.width * .15 +
                                (_animation.value * Get.width * .3),
                            child: child!,
                          );
                        },
                        child: _buildWaterContainer(),
                      ),
                      // Second water container
                      AnimatedBuilder(
                        animation: _animation,
                        builder: (context, child) {
                          return Positioned(
                            left: -Get.width * .3 +
                                (_animation.value * Get.width * .3),
                            child: child!,
                          );
                        },
                        child: _buildWaterContainer(),
                      ),
                      // // Third water container
                      // AnimatedBuilder(
                      //   animation: _animation,
                      //   builder: (context, child) {
                      //     return Positioned(
                      //       left: -Get.width * .45 +
                      //           (_animation.value * Get.width * .3),
                      //       child: child!,
                      //     );
                      //   },
                      //   child: _buildWaterContainer(),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Build individual water container
  Widget _buildWaterContainer() {
    return Container(
      width: Get.width * .05, // Water bubble width
      height: Get.height * .020, // Thickness of water same as pipe
      color: Colors.blue, // Water color
    );
  }
}
