import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
      ),
      body: Column(children: [
        ListTile(
          leading: Icon(Icons.add_box_outlined),
          title: Text('About Us'),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.add_comment),
          title: Text('Concant'),
        ),
      ],),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.changeTheme(
            Get.isDarkMode ? ThemeData.light() : ThemeData.dark(),
          );
        },
        child: Icon(Icons.change_circle),
      ),
    );
  }
}
