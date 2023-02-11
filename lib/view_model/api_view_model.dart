import 'package:flutter/cupertino.dart';
import 'package:pixel/data/api_service.dart';
import 'package:pixel/models/product_model.dart';

class ApiProvider with ChangeNotifier {
  ApiService api = ApiService();
  var producData;
  var productCategeoryData;

  Future<ProductModel> fetctData() async {
    producData = await api.getData();
    notifyListeners();
    return producData;
  }

  Future<ProductModel> fetctCategeoryData(String category) async {
    productCategeoryData = await api.getCategoeryData(category);
    notifyListeners();
    return productCategeoryData;
  }
}
