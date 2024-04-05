import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Categorycontroller extends GetxController {
  List<dynamic> categoryProduct = [].obs;

  void fetchProduct(productName) async {
    String url =
        'https://www.texasknife.com/dynamic/texasknifeapi.php?action=cus_category';
    print(url);
    var res = await http.get(Uri.parse(url));
    final body = res.body;
    final json = jsonDecode(body);
    categoryProduct = json['data'];
    print(categoryProduct);
  }
}
