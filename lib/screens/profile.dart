import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_screen/getx_controler/logincontroller.dart';

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
        home: SafeArea(
      child: Scaffold(
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
