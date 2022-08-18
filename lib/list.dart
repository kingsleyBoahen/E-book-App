import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyListApp extends StatelessWidget {
  MyListApp({Key? key}) : super(key: key);

  List Users = [
    {
      "name": "Junior",
      "age": 18,
    },

    {
      "name": "Francis",
      "age": 20,
    },

    {
      "name": "James",
      "age": 22,
    },

    {
      "name": "Baah",
      "age": 23,
    },

    {
      "name": "Selina",
      "age": 19,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
         return ListTile(
          leading: CircleAvatar(),
          title: Text(Users[index]["name"]),
          subtitle: Text("Good evening"),
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