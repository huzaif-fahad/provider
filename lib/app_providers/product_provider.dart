import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/app_models/products_model.dart';

import '../app_services/remote_service.dart';

// ignore: camel_case_types
class productProvider with ChangeNotifier {
  Products? products;
  getPostData() async {
    products = (await getData());
    notifyListeners();
  }
}
