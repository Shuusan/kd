import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages_components/share_page/share_information_list.dart';
import '../pages_controllers/share_page_controller.dart';

class SharePage extends StatelessWidget {
  const SharePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Instantiate the ShareController
    final SharePageController controller = Get.put(SharePageController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("共有情報"),
      ),
      body: Column(
        children: [
          const Center(
            child: Text("Microsoft SQL Server - via Python"),
          ),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.shareInformation.isEmpty) {
                return const Center(child: Text('No information available'));
              }

              return ShareInformationList(controller: controller);
            }),
          ),
        ],
      ),
    );
  }
}
