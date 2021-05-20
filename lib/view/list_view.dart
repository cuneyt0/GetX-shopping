import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_restapi/controller/productController.dart';
import 'package:getx_restapi/model/product.dart';
import 'package:getx_restapi/view/product_listTile.dart';
import 'package:url_launcher/url_launcher.dart';

class ListeGorunumu extends StatelessWidget {
  final ProductController productController2 = Get.put(ProductController());
  late final Product _product;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(() {
        if (productController2.isLoading.value)
          return Center(child: CircularProgressIndicator());
        else
          return ProductListTile(productController2.productList[0]);
      }),
    );
  }
}
