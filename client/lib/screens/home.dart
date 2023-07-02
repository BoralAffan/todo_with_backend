import 'package:client/controller/signin_controller.dart';
import 'package:client/screens/add_todo.dart';
import 'package:client/screens/detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

@override
void initState() {
  // super.initState();
  signinController.getTodos();
}

SigninController signinController = Get.find();
// @override
// void initState() {
//   // super.initState();
//   signinController.getTodos();
// }

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        automaticallyImplyLeading: false,
        title: Text('Home Page'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.logout_outlined))
        ],
      ),
      body: GetBuilder<SigninController>(builder: (signinController) {
        // if (signinController.isTodoLoading) {
        //   return Center(
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       crossAxisAlignment: CrossAxisAlignment.center,
        //       children: [
        //         CircularProgressIndicator(
        //           color: Colors.red,
        //         ),
        //       ],
        //     ),
        //   );
        // }

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
            future: signinController.getTodos(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: Colors.red,
                ),
              ],
            ),
          );
              }
              if (snapshot.data != null) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      // DateTime createdAt = DateTime.parse(snapshot
                      //     .data![index].createdAt
                      //     .toString()); // Replace with your actual backend response
                      // String formattedDate =
                      //     DateFormat('yyyy-MM-dd HH:mm:ss').format(createdAt);

                      DateTime createdAt = DateTime.parse(
                          snapshot.data![index].createdAt.toString());
                      String formattedTime =
                          DateFormat.yMd().add_jm().format(createdAt.toLocal());
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailsScreen(
                                        title: snapshot.data![index].title,
                                        description:
                                            snapshot.data![index].description,
                                        id: snapshot.data![index].id,
                                      )));
                        },
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            //set border radius more than 50% of height and width to make circle
                          ),
                          child: Container(
                            height: size.height * 0.1,
                            margin: EdgeInsets.only(bottom: 13),
                            width: size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white),
                            child: ListTile(
                              title: Text(snapshot.data![index].title),
                              subtitle: Text(formattedTime),
                            ),
                          ),
                        ),
                      );
                    });
              }
              //  else if (snapshot.connectionState ==
              //     ConnectionState.waiting) {
              //   return CircularProgressIndicator();
              // }
              else {
                return Center(
                  child: Text(''),
                );
              }
            },
          ),
        );
      }),
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
