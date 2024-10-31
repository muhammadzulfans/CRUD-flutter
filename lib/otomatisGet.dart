import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'models/user_model.dart';

class OtomatisGet extends StatefulWidget {
  @override
  State<OtomatisGet> createState() => _OtomatisGetState();
}

class _OtomatisGetState extends State<OtomatisGet> {
  // const OtomatisGet({super.key});
  List allUser = [];

  Future getAllUser() async {
    try {
      var response = await http.get(Uri.parse("https://reqres.in/api/users"));
      var data = (json.decode(response.body) as Map<String, dynamic>)["data"];
      data.forEach((element) {
        allUser.add(
            UserModel(email: element['email'], name: element['first_name'], avatar: element['avatar'])
        );
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Future Building"),
      ),
      body: FutureBuilder(
          future: getAllUser(),
          builder: (context, snapshot) {
            return ListView.builder(
              itemCount: allUser.length,
              itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(allUser[index].avatar),
                ),
                title: Text("${allUser[index].name}"),
                subtitle: Text("${allUser[index].email}"),
              ),
            );
          }),
    );
  }
}