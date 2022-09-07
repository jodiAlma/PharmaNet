import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pharma_net/Models/ProductModel.dart';

import '../Network/api.dart';

class ProductController {
  Future<String> add_product(ProductModel productModel, imagePath) async {
    var res = await Network().auth(productModel.toJson(), '/add_product');
    // res.files.add(await http.MultipartFile.fromPath('image', imagePath));
    print(productModel);
    var body = json.decode(res.body);
    if (res.statusCode == 200) {
      print(body);
      return 'success';
    }
    return '';
  }

  Future<ProductModel> get_product_detailes(ProductModel productModel) async {
    var res = await Network().auth(productModel.toJson(), '/product_detalies');
    print(productModel);
    var body = json.decode(res.body);
    if (res.statusCode == 200) {
      print(body);
      return productModel;
    }
    return productModel;
  }

  Future<String> deleteProduct(ProductModel model) async {
    String url = '127.0.0.1:8000/api/addProduct'; // from postman collection
    var request = http.MultipartRequest('get', Uri.parse(url));

    request.files.remove(
        http.MultipartFile.fromString('json', model.toJson().toString()));

    var response = await request.send().timeout(Duration(minutes: 2));
    if (response.statusCode == 200) {
      return 'success';
    }
    return '';
  }
}
