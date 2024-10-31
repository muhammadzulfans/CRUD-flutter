import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostData extends StatefulWidget {
  const PostData({super.key});

  @override
  State<PostData> createState() => _PostDataState();
}

class _PostDataState extends State<PostData> {
  TextEditingController nameC = TextEditingController();
  TextEditingController jobC = TextEditingController();
  String resultRespon = "Belum Ada Data";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("POST DATA"),
      ),body: ListView(
      padding: EdgeInsets.all(20),
      children: [
        TextField(
          controller: nameC,
          decoration: InputDecoration(
            label: Text("Name"),
            border: OutlineInputBorder()
          ),
        ),
        SizedBox(height: 20,),
        TextField(
          controller: jobC,
          decoration: InputDecoration(
              label: Text("Name"),
              border: OutlineInputBorder()
          ),
        ),
        SizedBox(height: 20,),
        ElevatedButton(onPressed: () async{
          var response = await http.post(
              Uri.parse("https://reqres.in/api/users"),
              body: {"name": nameC.text, "job": jobC.text}
              );
           print(response.body);
           setState(() {
             resultRespon = response.body;
           });

        }, child: Text("SUBMIT")),
        SizedBox(height: 20,),
        Divider(),
        SizedBox(height: 20,),
        Text(resultRespon),
      ],
    ),
    );
  }
}
