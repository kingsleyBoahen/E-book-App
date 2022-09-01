import 'package:bmi_app/breaking_bad_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyListApp extends StatelessWidget {
  MyListApp({Key? key}) : super(key: key);

  // List Users = [
  //   {
  //     "name": "Junior",
  //     "age": 18,
  //   },

  //   {
  //     "name": "Francis",
  //     "age": 20,
  //   },

  //   {
  //     "name": "James",
  //     "age": 22,
  //   },

  //   {
  //     "name": "Baah",
  //     "age": 23,
  //   },

  //   {
  //     "name": "Selina",
  //     "age": 19,
  //   },
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: breakingBadApi.length,
        itemBuilder: (context, index) {
         return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(breakingBadApi[index]["img"]),
          ),
          title: Text(breakingBadApi[index]["name"]),
          subtitle: Text(breakingBadApi[index]["nickname"]),
          trailing: Column(
            children: [
              Text("10.00"),
              CircleAvatar(
                backgroundColor: Colors.green,
                radius: 10,
                child: Text(index.toString()),
              )
            ],
          ),
         );
        },
        ),
    );
  }
}