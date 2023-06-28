import 'package:client/widgets/input_field.dart';
import 'package:flutter/material.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  TextEditingController titleController = TextEditingController();

  TextEditingController descController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text('Add new task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(children: [
          InputField(
              hintText: 'Enter title',
              height: size.height * 0.07,
              controller: titleController),
          SizedBox(
            height: size.height * 0.03,
          ),
          InputField(
              hintText: 'Description',
              height: size.height * 0.26,
              controller: descController),
          SizedBox(
            height: size.height * 0.02,
          ),
          Container(
            height: size.height * 0.05,
            width: size.width * 0.3,
            decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(8)),
            child: Center(
                child: Text(
              'Add',
              style:
                  TextStyle(color: Colors.white, fontSize: size.height * 0.02),
            )),
          ),
        ]),
      ),
    );
  }
}
