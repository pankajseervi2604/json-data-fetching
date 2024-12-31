import 'dart:convert';

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List data = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('json loading app')),
      body: Center(
        child: FutureBuilder(
          future: DefaultAssetBundle.of(context)
              .loadString("json_file/person.json"),
          builder: (context, snapshot) {
            var mydata = json.decode(snapshot.data.toString());
            return ListView.builder(
              itemCount: mydata == null ? 0 : mydata.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text("Name : "+mydata[index]['name']),
                      Text("age : "+mydata[index]['age'].toString()),
                      Text("Height : "+mydata[index]['height'].toString()),
                      Text("Gender : "+mydata[index]['gender']),
                      Text("Reg No : "+mydata[index]['reg_no']),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
