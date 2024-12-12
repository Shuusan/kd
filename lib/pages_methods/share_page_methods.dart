import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart'; // Import intl package for date formatting

import '../classes/share_info.dart';

Future<void> showEditDialog(BuildContext context, ShareInfo shareInfo,
    Function(ShareInfo updatedInfo) onSave) async {
  final titleController = TextEditingController(text: shareInfo.infoTitle);
  final subtitleController =
      TextEditingController(text: shareInfo.infoSubtitle);
  final levelController =
      TextEditingController(text: shareInfo.infoLevel.toString());

  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Edit Share Info'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: subtitleController,
              decoration: const InputDecoration(
                labelText: 'Subtitle',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: levelController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Level',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog without saving
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              // Format the current date to YYYY-MM-DD
              final formattedDate =
                  DateFormat('yyyy-MM-dd').format(DateTime.now());

              // Update the ShareInfo object and pass it back
              final updatedInfo = ShareInfo(
                infoId: shareInfo.infoId,
                infoLevel: int.parse(levelController.text),
                infoTitle: titleController.text,
                infoSubtitle: subtitleController.text,
                copyActive: shareInfo.copyActive,
                dateAdded: shareInfo.dateAdded, // Keep existing dateAdded
                dateModified:
                    formattedDate, // Use formatted date for dateModified
              );

              onSave(updatedInfo);
              Navigator.pop(context); // Close the dialog
            },
            child: const Text('Save'),
          ),
        ],
      );
    },
  );
}

Future<void> showAddDialog(
    BuildContext context, Function(ShareInfo newInfo) onSave) async {
  final titleController = TextEditingController();
  final subtitleController = TextEditingController();
  final levelController = TextEditingController();
  bool isCopyActive = false; // Default value for copyActive

  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Add New Share Info'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: subtitleController,
                decoration: const InputDecoration(
                  labelText: 'Subtitle',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: levelController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Level',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Is Copyable:'),
                  Switch(
                    value: isCopyActive,
                    onChanged: (value) {
                      isCopyActive = value;
                      // Update the state to reflect the change
                      (context as Element).markNeedsBuild();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog without saving
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              // Generate a unique UUID for infoId
              const uuid = Uuid();

              // Format the current date to YYYY-MM-DD
              final formattedDate =
                  DateFormat('yyyy-MM-dd').format(DateTime.now());

              final newInfo = ShareInfo(
                infoId: uuid.v4(), // Proper UUID for uniqueidentifier
                infoLevel: int.tryParse(levelController.text) ?? 0,
                infoTitle: titleController.text,
                infoSubtitle: subtitleController.text,
                copyActive: isCopyActive,
                dateAdded: formattedDate, // Use formatted date for dateAdded
                dateModified: null, // Default null for new entries
              );

              onSave(newInfo);
              Navigator.pop(context); // Close the dialog
            },
            child: const Text('Add'),
          ),
        ],
      );
    },
  );
}
