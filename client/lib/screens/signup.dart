import 'package:client/controller/signin_controller.dart';
import 'package:client/screens/login.dart';
import 'package:client/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

TextEditingController nameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passController = TextEditingController();

class _SignUpScreenState extends State<SignUpScreen> {
  SigninController signinController = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    @override
    void dispose() {
      nameController.dispose;
      emailController.dispose;
      passController.dispose;
      super.dispose();
    }

    return GetBuilder<SigninController>(builder: (signinController) {
      return Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InputField(hintText: 'Enter name', controller: nameController),
                SizedBox(
                  height: size.height * 0.03,
                ),
                InputField(
                    hintText: 'Enter email', controller: emailController),
                SizedBox(
                  height: size.height * 0.03,
                ),
                InputField(
                    hintText: 'Enter password', controller: passController),
                SizedBox(
                  height: size.height * 0.03,
                ),
                InkWell(
                  onTap: () {
                    signinController.registerUser(
                      nameController.text,
                        emailController.text, passController.text, context);
                  },
                  child: Container(
                    height: size.height * 0.05,
                    width: size.width * 0.3,
                    decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                        child: signinController.isLoading
                            ? CircularProgressIndicator(color: Colors.orangeAccent,)
                            : Text(
                                'Signup',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: size.height * 0.02),
                              )),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: Text('Already a user? LOG IN',
                      style: TextStyle(color: Colors.blue)),
                )
              ],
            ),
          ));
    });
  }
}
