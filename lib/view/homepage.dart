import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import 'package:getx_restapi/controller/productController.dart';
import 'package:getx_restapi/model/product.dart';
import 'package:getx_restapi/view/Grid_view.dart';
import 'package:getx_restapi/view/Shopping.dart';
import 'package:getx_restapi/view/list_view.dart';
import 'package:getx_restapi/view/product_tile.dart';
import 'package:getx_restapi/view/settinggs.dart';

class MyHomePage extends StatelessWidget {
  final ProductController productController2 = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
        actions: [
          Shopping(),
          IconButton(
            icon: Icon(
              Icons.settings,
            ),
            onPressed: () => Get.to(Settings()),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Shop',
                    style: TextStyle(fontFamily: "Orbitron",fontSize: 32, ),
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.view_list_rounded),
                    onPressed: () {
                      print("ListView");
                      productController2.deger.value = false;
                      print(productController2.deger.value.toString());
                    }),
                IconButton(
                    icon: Icon(Icons.grid_view),
                    onPressed: () {
                      print("Grid görünüme geçti");
                      productController2.deger.value = true;
                      print(productController2.deger.value.toString());
                    }),
              ],
            ),
          ),
          Obx(
            () => productController2.deger.value == true
                ? GridGorunumu()
                : ListeGorunumu(),
          ),
        ],
      ),
    );
  }


}
