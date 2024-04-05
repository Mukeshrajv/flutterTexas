import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Productcontroller extends GetxController {
  List<dynamic> featureProduct = [].obs;

  void fetchProduct(productName) async {
    String url =
        'https://www.texasknife.com/dynamic/texasknifeapi.php?action=cus_featured_product';
    print(url);
    var res = await http.get(Uri.parse(url));
    final body = res.body;
    final json = jsonDecode(body);
    featureProduct = json['data'];
    print(featureProduct);
  }
}
