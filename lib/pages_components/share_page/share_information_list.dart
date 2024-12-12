import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kd/pages_controllers/share_page_controller.dart';

import '../../pages_methods/share_page_methods.dart';

class ShareInformationList extends StatelessWidget {
  const ShareInformationList({
    super.key,
    required this.controller,
  });

  final SharePageController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.shareInformation.length,
      itemBuilder: (context, index) {
        var info = controller.shareInformation[index];
        return Card(
          child: ListTile(
            leading: Icon(
              Icons.info_rounded,
              color: info.infoLevel <= 1 ? Colors.blueGrey : Colors.redAccent,
            ),
            title: Text(info.infoTitle),
            subtitle: Text(
                "${info.infoSubtitle}\n${info.dateModified ?? info.dateAdded}"),
            isThreeLine: true,
            trailing: SizedBox(
              width: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Tooltip(
                        message: '削除',
                        child: IconButton(
                          onPressed: () async {
                            await controller.deleteShareInfo(info.infoId);
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
                            showEditDialog(
                              context,
                              info,
                              (updatedInfo) async {
                                await controller.updateShareInfo(
                                    updatedInfo); // Call the update method in the controller
                              },
                            );
                          },
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.cyan,
                            size: 20,
                          ),
                        ),
                      ),
                      if (info.copyActive)
                        Tooltip(
                          message: 'クリップボードにコピー',
                          child: IconButton(
                            onPressed: () {
                              Clipboard.setData(
                                  ClipboardData(text: info.infoSubtitle));
                              Get.snackbar(
                                'Copied to clipboard!',
                                info.infoSubtitle,
                                backgroundColor: Colors.green,
                                colorText: Colors.white,
                                onTap: (_) => Get.back(),
                              );
                            },
                            icon: const Icon(
                              Icons.copy,
                              size: 20,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
