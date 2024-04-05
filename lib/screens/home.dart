import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_screen/getx_controler/Productcontroller.dart';
import 'package:register_screen/getx_controler/categorycontroller.dart';
import 'package:register_screen/getx_controler/logincontroller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

final LoginController homeController = Get.put(LoginController());
final Productcontroller feature = Get.put(Productcontroller());
final Categorycontroller Category = Get.put(Categorycontroller());

class _RegisterPageState extends State<RegisterPage> {
  String? userName;
  // String? productName;
  List<String> productNames = [];
  List<String> productPrice = [];
  List<String> productImage = [];
  List<String> categoryName = [];
  List<String> categoryImage = [];
  getData() {
    for (var obj in homeController.loginList) {
      setState(() {
        userName = obj['user_name'];
      });
    }
  }

  getProduct() {
    for (var obj in feature.featureProduct) {
      setState(() {
        productNames.add(obj['product_name']);
        productPrice.add(obj['product_price']);
        productImage.add(obj['product_image']);
        print(productNames);
        print(productPrice);
      });
    }
  }

  getCategory() {
    for (var obj in Category.categoryProduct) {
      setState(() {
        categoryName.add(obj['name']);
        categoryImage.add(obj['image']);
        print(categoryName);
      });
    }
  }

  @override
  void initState() {
    getData();
    getProduct();
    getCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        // ignore: unnecessary_brace_in_string_interps
                        Text('hello'),
                        Text('${userName}'),
                      ],
                    ),
                    Image.asset(
                      'assets/TexasImage.png',
                      width: 50,
                      height: 50,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        // Add your button press logic here
                        print('Text button with icon pressed');
                      },
                      icon: const Icon(
                        Icons.qr_code,
                        color: Colors.red,
                      ),
                      label: const Text(
                        'Enter Scan',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                        ),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 111, 198, 238))),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        // Add your button press logic here
                        print('Text button with icon pressed');
                      },
                      icon: const Icon(
                        Icons.qr_code,
                        color: Colors.red,
                      ),
                      label: const Text(
                        'Enter Code',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                        ),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 111, 198, 238))),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text('Feature Products'),
                Expanded(
                  flex: 1,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: feature.featureProduct.length,
                      // itemExtent: 50,
                      itemBuilder: ((context, index) {
                        return Container(
                          width: 150,
                          // height: 200,
                          decoration:
                              BoxDecoration(border: Border.all(width: 1)),
                          margin: EdgeInsets.all(5),
                          child: Column(
                            children: [
                              Text('${productNames[index]}'),
                              Text('${productPrice[index]}'),
                              Container(
                                  width: 150,
                                  height: 100,
                                  alignment: Alignment.center,
                                  child:
                                      Image.network('${productImage[index]}'))
                            ],
                          ),
                          // child: Text('${productNames[index]}'),
                        );
                      })),
                ),
                Text('Categories'),
                Expanded(
                  flex: 2,
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Number of columns
                        crossAxisSpacing: 10.0, // Spacing between the columns
                        mainAxisSpacing: 10.0, // Spacing between the rows
                      ),
                      // scrollDirection: Axis.horizontal,
                      itemCount: Category.categoryProduct.length,
                      // itemExtent: 50,
                      itemBuilder: ((context, index) {
                        return Container(
                          width: 100,
                          // height: 200,
                          decoration:
                              BoxDecoration(border: Border.all(width: 1)),
                          margin: EdgeInsets.all(5),
                          child: Column(
                            children: [
                              Text('${categoryName[index]}'),
                              Container(
                                  width: 100,
                                  // height: 200,
                                  alignment: Alignment.center,
                                  child:
                                      Image.network('${categoryImage[index]}'))
                            ],
                          ),
                          // child: Text('${productNames[index]}'),
                        );
                      })),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
