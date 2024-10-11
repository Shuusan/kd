import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../settings/api_setting.dart';

class SharePageController extends GetxController {
  // Observable list to hold the data fetched from the API
  var shareInformation = [].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchShareInformation();
  }

  // Method to fetch data from the API
  Future<void> fetchShareInformation() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse('$baseURL/share_information'));

      if (response.statusCode == 200) {
        shareInformation.value = jsonDecode(response.body);
      } else {
        throw Exception('Failed to load data');
      }
    } finally {
      isLoading(false);
    }
  }
}
