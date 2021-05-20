import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:getx_restapi/controller/productController.dart';

class Shopping extends StatelessWidget {
  final ProductController productController2 = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.shopping_cart,
      ),
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Align(
                  child: Text(
                    "ALIŞVERİŞ",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).accentColor),
                  ),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Align(
                          child: Text(
                            "Tutar: ",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Align(
                            child: Obx(
                          () => Text(
                              "\$ ${productController2.total.toString()} "),
                        )),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.red),
                              ),
                              onPressed: () {
                                productController2.total.value = 0.0;
                              },
                              child: Text("Alışverişi \n  Iptal et"),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Get.snackbar(
                                  "Alışveriş", "Başarıyla satın Alındı",duration: Duration(seconds: 1));
                            },
                            child: Text("Satın AL"),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            });
      },
    );
  }
}
