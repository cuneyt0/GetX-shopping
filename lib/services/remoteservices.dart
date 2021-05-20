import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:getx_restapi/model/product.dart';

class RemoteApi{

  final http.Client httpClient = http.Client();
  static var  baseUrl="http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline";

   Future fetchProduct() async {

     var response=await httpClient.get(Uri.parse(baseUrl));
     if(response.statusCode==200){
       var jsonString=response.body;
       return productFromJson(jsonString);

     }else{
       throw Exception("Veri Getirilemedi");
     }


  }

}

