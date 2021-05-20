import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:getx_restapi/controller/productController.dart';
import 'package:getx_restapi/view/product_tile.dart';


class GridGorunumu extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child:  Obx(() {
        if (productController.isLoading.value)
          return Center(child: CircularProgressIndicator());
        else
          return StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            itemCount: productController.productList.length,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            itemBuilder: (context, index) {
              return ProductTile(productController.productList[index]);
            },
            staggeredTileBuilder: (index) => StaggeredTile.fit(1),
          );
      }),
    );
  }
}
