import 'package:client/screens/add_todo.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        automaticallyImplyLeading: false,
        title: Text('Home Page'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.logout_outlined))
        ],
      ),
      body: Center(child: Text("home")),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orangeAccent,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddTodo()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
