import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

              return ListView.builder(
                itemCount: controller.shareInformation.length,
                itemBuilder: (context, index) {
                  var info = controller.shareInformation[index];
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.info_rounded),
                      title: Text(info['info_title']),
                      subtitle: Text(
                          '${info['info_subtitle']} ... ${info['date_added']}'),
                      trailing: SizedBox(
                        width: 120,
                        child: Row(
                          children: [
                            Tooltip(
                              message: '削除',
                              child: IconButton(
                                onPressed: () {
                                  // Handle delete action here
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                  size: 20,
                                ),
                              ),
                            ),
                            Tooltip(
                              message: 'データ編集',
                              child: IconButton(
                                onPressed: () {
                                  // Handle edit action here
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.cyan,
                                  size: 20,
                                ),
                              ),
                            ),
                            Tooltip(
                              message: 'クリップボードにコピー',
                              child: IconButton(
                                onPressed: () {
                                  // Handle copy to clipboard action here
                                },
                                icon: const Icon(
                                  Icons.copy,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
