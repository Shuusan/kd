import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kd/pages_components/factory_automation_page/water_pipe_horizontal.dart';
import 'package:kd/pages_controllers/factory_automation_page_controller.dart';

import '../pages_components/factory_automation_page/pomp.dart';

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
          LayoutBuilder(
            builder: (context, constraints) => SizedBox(
              width: Get.width,
              height: Get.height * 0.35,
              child: Obx(
                () => Stack(
                  children: [
                    // Pipe 1
                    Positioned(
                        bottom: Get.height * .063,
                        left: Get.width * .095,
                        child: WaterPipeHorizontal(
                            height: Get.height, width: Get.width)),

                    // Pomp
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: Pomp(controller: controller),
                    ),

                    // Tank
                    Positioned(
                      top: Get.height * 0.125,
                      left: Get.width * 0.225,
                      child: Container(
                        width: Get.width * 0.125, // Tank width
                        height: Get.height * 0.2, // Tank height
                        decoration: BoxDecoration(
                          color: Colors.blue.shade100, // Water color
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(20),
                            bottom: Radius.circular(5),
                          ),
                          border: Border.all(
                            color: Colors.grey.shade800,
                            width: 3,
                          ),
                        ),
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            // Water level
                            Positioned(
                              bottom: 0,
                              child: Container(
                                width: Get.width *
                                    0.12, // Slightly smaller to fit inside the border
                                height: Get.height *
                                    0.1, // Adjust to show current water level
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade700,
                                  borderRadius: const BorderRadius.vertical(
                                    bottom: Radius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                            // Top of the tank
                            Positioned(
                              top: 0,
                              child: Container(
                                width: Get.width * 0.125,
                                height: Get.height * 0.03,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade800,
                                  borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(30),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
