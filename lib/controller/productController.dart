import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_restapi/model/product.dart';
import 'package:getx_restapi/services/remoteservices.dart';

class ProductController extends GetxController {
  var productList = <Product>[].obs;
  var isLoading = true.obs;
  var deger=false.obs;

  var _total=1.0.obs;



  get total => _total;



  @override
  void onInit() {
    fetchProduct();
    super.onInit();
  }

  void fetchProduct() async {
    try {
      isLoading(true);
      var product = await RemoteApi().fetchProduct();
      if (product != null) {
        productList.value = product;
      }
    } finally {
      isLoading(false);
    }
  }
}
