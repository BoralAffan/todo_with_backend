import 'dart:convert';

import 'package:client/screens/home.dart';
import 'package:client/screens/login.dart';
import 'package:client/services/service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SigninController extends GetxController {
  bool isLoading = false;
  String uid = '';
  void showErrorSnackbar(title, msg, {seconds = 2}) {
    Get.closeAllSnackbars();
    Get.snackbar(
      title,
      msg,
      backgroundColor: Colors.black,
      colorText: Colors.white70,
      icon: const Icon(Icons.error),
      shouldIconPulse: false,
      animationDuration: Duration(seconds: seconds),
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(6),
    );
  }

  Future<void> loginUser(
      String email, String password, BuildContext context) async {
    try {
      isLoading = true;
      update();

      var response = await Services.loginUSer(email, password);
      if (response.statusCode == 200) {
        print('login sucess');
        var decodecResponse = jsonDecode(response.body);
        isLoading = false;
        uid = decodecResponse['user']['_id'];
        update();

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home()));
      }else if (response.statusCode == 401) {
        isLoading = false;
        update();
        showErrorSnackbar('Invalid Credentials', 'Incorrect Password please correct it');
      } 
      
      else if (response.statusCode == 404) {
        isLoading = false;
        update();
        showErrorSnackbar('USER NOT FOUND',
            'Account does not exist. please register first');
      } else if (response.statusCode == 500) {
        isLoading = false;
        update();
        showErrorSnackbar('Error', 'Some error occured');
      } else {
        isLoading = false;
        update();
        throw "failed to Login user";
      }
    } catch (error) {
      print(error);
    }
  }

  Future<void> registerUser(
      String name, String email, String password, BuildContext context) async {
    try {
      isLoading = true;
      update();
      var response = await Services.registerNewUSer(name, email, password);

      if (response.statusCode == 201) {
        var decodedResponse = jsonDecode(response.body);
        print(decodedResponse['newUser']['_id']);

        isLoading = false;
        uid = decodedResponse['newUser']['_id'];
        update();
        print('user registered successfull');
        showErrorSnackbar('Success', 'User created successfully, Now login ');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login()));
      } else if (response.statusCode == 409) {
        isLoading = false;
        update();
        showErrorSnackbar('Already exist',
            'User Already exists with the credentials . please login');
      } else if (response.statusCode == 500) {
        isLoading = false;
        update();
        showErrorSnackbar('Error', 'Some error occured');
      } else {
        isLoading = false;
        update();
        throw "failed to register user";
      }
    } catch (error) {
      print(error);
    }
  }
}
