import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_restapi/controller/productController.dart';
import 'package:getx_restapi/model/product.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductListTile extends StatelessWidget {
  final ProductController productController2 = Get.put(ProductController());
  final Product _product;
  var toplam;

  ProductListTile(this._product);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: productController2.productList.length,
        itemBuilder: (context, index) {
          return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 5,
            color: Colors.teal,
            child: ListTile(
                onTap: () async {
                  print("tıklanıldı");
                  var url =
                      await productController2.productList[index].websiteLink;
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {}
                  throw 'Link bulunamadı $url';
                },
                leading: Container(
                  height: 50,
                  width: 50,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  child: Stack(
                    children: [
                      Center(
                          child: Opacity(
                              opacity: 0.8,
                              child: Icon(
                                Icons.star,
                                size: 50,
                                color: Colors.greenAccent,
                              ))),
                      Center(
                        child: Text(
                          productController2.productList[index].rating
                              .toString(),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                title: Text(
                  productController2.productList[index].name,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  productController2.productList[index].productType.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                trailing: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white38),
                  ),
                  onPressed: () {
                    toplam = double.parse(
                        productController2.productList[index].price);
                    productController2.total.value += toplam;
                    Get.snackbar("Sepete Eklendi",
                        productController2.productList[index].name,
                        duration: Duration(seconds: 2));
                    print(toplam.runtimeType);
                  },
                  child: Text(
                    '${"\$" + productController2.productList[index].price.toString()}',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontFamily: "Orbitron",
                        ),
                  ),
                )),
          );
        });
  }
}
/*
*return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 5,
            color: Colors.teal,
            child: ListTile(
                onTap: () async {
                  print("tıklanıldı");
                  var url =
                      await productController2.productList[index].websiteLink;
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {}
                  throw 'Link bulunamadı $url';
                },
                leading: Container(
                  height: 50,
                  width: 50,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  child: Stack(
                    children: [
                      Center(
                          child: Opacity(
                              opacity: 0.8,
                              child: Icon(
                                Icons.star,
                                size: 50,
                                color: Colors.greenAccent,
                              ))),
                      Center(
                        child: Text(
                          productController2.productList[index].rating
                              .toString(),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                title: Text(
                  productController2.productList[index].name,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  productController2.productList[index].productType.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                trailing: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white38),
                  ),
                  onPressed: () {
                    toplam = double.parse(
                        productController2.productList[index].price);
                    productController2.total.value += toplam;
                    Get.snackbar("Sepete Eklendi",
                        productController2.productList[index].name,
                        duration: Duration(seconds: 2));
                    print(toplam.runtimeType);
                  },
                  child: Text(
                    '${"\$" + productController2.productList[index].price.toString()}',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w400),
                  ),
                )),
          );
*
* */
