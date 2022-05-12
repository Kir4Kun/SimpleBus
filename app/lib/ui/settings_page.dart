import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromRGBO(232, 234, 246, 1),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Privacy Policy'),
            onTap: () {
              Get.toNamed('/privacy');
            },
          ),
          const Divider(),
          const ListTile(
            title: Text('Terms of Service'),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
