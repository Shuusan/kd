import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../classes/share_info.dart';
import '../settings/api_setting.dart';

class SharePageController extends GetxController {
  // Observable list to hold the data fetched from the API
  RxList<ShareInfo> shareInformation = <ShareInfo>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchShareInformation();
  }

  // CREATE : Method to create shared info data
  Future<void> addShareInfo(ShareInfo newInfo) async {
    const url = '$baseURL/share_information'; // Ensure you have a POST endpoint
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(newInfo.toJson()),
      );
      if (response.statusCode == 201) {
        shareInformation.add(newInfo); // Add the new item to the list
      } else {
        throw Exception('Failed to add new info');
      }
    } catch (e) {
      debugPrint('Error adding info: $e');
    }
  }

  // UPDATE : Method to update shared info data
  Future<void> updateShareInfo(ShareInfo updatedInfo) async {
    final url =
        '$baseURL/share_information/${updatedInfo.infoId}'; // Ensure you have a PUT endpoint
    try {
      final response = await http.put(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(updatedInfo.toJson()),
      );
      if (response.statusCode == 200) {
        // Update the item in the list
        final index = shareInformation
            .indexWhere((info) => info.infoId == updatedInfo.infoId);
        if (index != -1) {
          shareInformation[index] = updatedInfo;
        }
      } else {
        throw Exception('Failed to update the entry');
      }
    } catch (e) {
      debugPrint('Error updating info: $e');
    }
  }

  // READ : Method to fetch data from share information table SQL
  Future<void> fetchShareInformation() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse('$baseURL/share_information'));

      if (response.statusCode == 200) {
        List<dynamic> jsonData = jsonDecode(response.body);
        // Convert JSON data to a list of ShareInfo objects
        shareInformation.value =
            jsonData.map((data) => ShareInfo.fromJson(data)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } finally {
      isLoading(false);
    }
  }

  // DELETE : Method to delete item using ID
  Future<void> deleteShareInfo(String infoId) async {
    final url =
        '$baseURL/share_information/$infoId'; // Ensure you have a DELETE endpoint
    try {
      final response = await http.delete(Uri.parse(url));
      if (response.statusCode == 200) {
        // Remove the deleted item from the list
        shareInformation.removeWhere((info) => info.infoId == infoId);
      } else {
        throw Exception('Failed to delete the entry');
      }
    } catch (e) {
      debugPrint('Error deleting info: $e');
    }
  }
}
