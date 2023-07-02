import 'package:client/controller/signin_controller.dart';
import 'package:client/screens/home.dart';
import 'package:client/widgets/input_field.dart';
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

TextEditingController desccontroller = new TextEditingController();
TextEditingController titlecontroller = new TextEditingController();
SigninController signinController = Get.find();
bool isEdit = false;

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    super.initState();
    desccontroller.text = widget.description;
    titlecontroller.text = widget.title;
    // Set the initial value of the controller
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    void toggleEdit() {
      setState(() {
        isEdit = !isEdit;
      });
    }

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
              icon: Icon(Icons.delete)),
          Visibility(
            visible: isEdit,
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.green,
              child: IconButton(
                  onPressed: () {
                     signinController.updateTodo(
                        widget.id, titlecontroller.text,  desccontroller.text, context);
                    // toggleEdit();
                   
                  },
                  icon: Icon(Icons.done)),
            ),
          ),
          Visibility(
              visible: !isEdit,
              child: IconButton(
                  onPressed: () {
                    toggleEdit();
                  },
                  icon: Icon(Icons.edit)))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: !isEdit,
                child: Text(
                  widget.description,
                  style: TextStyle(fontSize: size.height * 0.03),
                ),
              ),
              Visibility(
                visible: isEdit,
                child: Text(
                  'Edit your description and title ',
                  style: TextStyle(fontSize: size.height * 0.03),
                ),
              ),
              Visibility(
                visible: isEdit,
                child: Container(
                    height: size.height * 0.1,
                    width: size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey, width: 1)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 4),
                      child: TextField(
                        controller: titlecontroller,
                        maxLines:
                            null, // Set maxLines to null to enable multiple lines
                        keyboardType: TextInputType
                            .multiline, // Set the keyboard type to multiline
                        textInputAction: TextInputAction.newline,
                        decoration: InputDecoration(
                          labelText: 'title ',
                          border: InputBorder.none, // Remove the underline
                        ),
                      ),
                    )),
              ),
              Visibility(
                visible: isEdit,
                child: Container(
                    height: size.height * 0.3,
                    width: size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey, width: 1)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 4),
                      child: TextField(
                        controller: desccontroller,
                        maxLines:
                            null, // Set maxLines to null to enable multiple lines
                        keyboardType: TextInputType
                            .multiline, // Set the keyboard type to multiline
                        textInputAction: TextInputAction.newline,
                        decoration: InputDecoration(
                          labelText: 'description',
                          border: InputBorder.none, // Remove the underline
                        ),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
