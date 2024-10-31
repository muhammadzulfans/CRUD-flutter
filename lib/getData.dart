import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetData extends StatefulWidget {
  const GetData({super.key});

  @override
  State<GetData> createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {
  late int id;

  late String email;

  late String name;


  @override
  void initState() {
    id = 0;
    email = "";
    name = "";
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GET DATA"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("ID : $id"),
            Text("NAME : $name"),
            Text("EMAIL : $email"),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () async {
              var response = await http.get(Uri.parse("https://reqres.in/api/users/2"));
              if(response.statusCode==200) {
                Map<String, dynamic> data = json.decode(response.body);
                print(data['data']['email']);
                setState(() {
                  id = data['data']["id"];
                  name = data['data']["first_name"]+" "+data['data']["last_name"];
                  email = data['data']["email"];
                });
              }else{
                Text("Error");
              }
            }, child: Text("GET"))
          ],
        ),
      ),
    );
  }
}