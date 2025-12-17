import 'package:dio/dio.dart';
import 'package:kiemtragiuaky/model/product.dart';

class API {
  Future<List<Product>> getAllProduct() async {
    var dio = Dio();
    List<Product> lsProduct = [];
    var response = await dio.request('https://fakestoreapi.com/products');

    if (response.statusCode == 200) {
      List ls = response.data;
      lsProduct = ls.map((json) => Product.fromJson(json)).toList();
    } else {
      print("Lỗi kết nối API");
    }
    return lsProduct;
  }
}

var test_api = API();
