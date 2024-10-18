import 'package:flutter/material.dart';
import 'package:kd/pages_controllers/share_page_controller.dart';

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
            subtitle: Text(info.infoSubtitle),
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
