import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kd/pages/factory_automation_page.dart';

import 'pages/home_page.dart';
import 'pages/share_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const HomePage()),
        GetPage(name: '/share', page: () => const SharePage()),
        GetPage(
          name: '/factory_automation',
          page: () => const FactoryAutomationPage(),
        ),
      ],
    );
  }
}
