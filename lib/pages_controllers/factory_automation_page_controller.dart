import 'package:get/get.dart';

class FactoryAutomationPageController extends GetxController {
  // Observable list to hold the data fetched from the API
  // RxList<ShareInfo> shareInformation = <ShareInfo>[].obs;
  // var isLoading = true.obs;

  final RxBool _isHovered = false.obs;
  bool get isHovered => _isHovered.value;
  set isHovered(bool value) => _isHovered.value = value;

  final RxBool _isPumpOn = false.obs;
  bool get isPumpOn => _isPumpOn.value;
  set isPumpOn(bool value) => _isPumpOn.value = value;

  void togglePump() {
    _isPumpOn.toggle();
  }

  // Method to fetch data from the API
  // Future<void> fetchShareInformation() async {
  //   try {
  //     isLoading(true);
  //     final response = await http.get(Uri.parse('$baseURL/share_information'));

  //     if (response.statusCode == 200) {
  //       List<dynamic> jsonData = jsonDecode(response.body);
  //       // Convert JSON data to a list of ShareInfo objects
  //       shareInformation.value =
  //           jsonData.map((data) => ShareInfo.fromJson(data)).toList();
  //     } else {
  //       throw Exception('Failed to load data');
  //     }
  //   } finally {
  //     isLoading(false);
  //   }
  // }
}
