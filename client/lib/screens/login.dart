import 'package:client/controller/signin_controller.dart';
import 'package:client/screens/signup.dart';
import 'package:client/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  SigninController signinController = Get.find();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    @override
    void dispose() {
      emailController.dispose;
      passController.dispose;
      super.dispose();
    }

    return GetBuilder<SigninController>(builder: (signinController) {
      return Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InputField(
                  height: size.height * 0.07,
                    hintText: 'Enter email', controller: emailController),
                SizedBox(
                  height: size.height * 0.03,
                ),
                InputField(
                  height: size.height * 0.07,
                    hintText: 'Enter password', controller: passController),
                SizedBox(
                  height: size.height * 0.03,
                ),
                InkWell(
                  onTap: () {
                    signinController.loginUser(
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
                            ? CircularProgressIndicator(
                                color: Colors.orangeAccent,
                              )
                            : Text(
                                'Login',
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignUpScreen()));
                  },
                  child: Text('New  user? Signup',
                      style: TextStyle(color: Colors.blue)),
                )
              ],
            ),
          ));
    });
  }
}
