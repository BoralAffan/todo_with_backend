import 'package:client/controller/signin_controller.dart';
import 'package:client/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatefulWidget {
  String title;
  String description;
  String id;
  DetailsScreen(
      {super.key,
      required this.title,
      required this.description,
      required this.id});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

SigninController signinController = Get.find();

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
            icon: Icon(Icons.arrow_back)),
        actions: [
          IconButton(
              onPressed: () {
                signinController.deleteTodo(widget.id, context);
              },
              icon: Icon(Icons.delete))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                widget.description,
                style: TextStyle(fontSize: size.height * 0.03),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
