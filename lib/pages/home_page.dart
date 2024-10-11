// Define the HomePage class
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('第ニＳＩ技術部'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the SharePage when the button is pressed using the named route
                      Get.toNamed('/share');
                    },
                    child: const Text("部内共有情報"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
