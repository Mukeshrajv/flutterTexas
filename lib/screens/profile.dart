import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_screen/getx_controler/logincontroller.dart';
import 'package:register_screen/screens/loginPage.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

final LoginController controller = Get.put(LoginController());

class _ProfileState extends State<Profile> {
  String? userName;
  String? email;
  getData() {
    for (var obj in controller.loginList) {
      setState(() {
        userName = obj['user_name'];
        email = obj['email'];
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
            // appBar: AppBar(
            //   title: Text('Profile'),
            //   leading: IconButton(
            //     icon: Icon(Icons.arrow_back),
            //     onPressed: () {
            //       Navigator.pushReplacementNamed(context, '/loginPage');
            //     },
            //   ),
            // ),
            body: Column(
              children: [
                GetBuilder<LoginController>(
                  builder: (controller) {
                    return Text(
                      'Name: ${userName}',
                      style: const TextStyle(fontSize: 18),
                    );
                  },
                ),
                Text('email: ${email}')
              ],
            ),
          ),
        ));
  }
}
