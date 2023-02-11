import 'package:pixel/models/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:pixel/utilities/utils.dart';

class ApiService {
  static var url = 'https://dummyjson.com/products';

  static var categeoryUrl = 'https://dummyjson.com/products/category/';
  Future<ProductModel> getData() async {
    var data;
    try {
      var client = http.Client();
      var response = await client.get(Uri.parse(url));
      if (response.statusCode == 200) {
        data = productModelFromJson(response.body);
      }
    } catch (e) {
      Utils().showMessage(e.toString());
    }
    return data;
  }

  Future<ProductModel> getCategoeryData(String category) async {
    var dataOne;
    try {
      var client = http.Client();
      var response = await client.get(Uri.parse(categeoryUrl+category));
      if (response.statusCode == 200) {
        dataOne = productModelFromJson(response.body);
      }
    } catch (e) {
      Utils().showMessage(e.toString());
    }
    return dataOne;
  }
}
