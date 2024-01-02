import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Vaibale_Api extends StatefulWidget {
  const Vaibale_Api({Key? key}) : super(key: key);

  @override
  State<Vaibale_Api> createState() => _Vaibale_ApiState();
}

class _Vaibale_ApiState extends State<Vaibale_Api> {
  var data;
  Future<void> getData()async{
    var url="https://jsonplaceholder.typicode.com/users";
    var response=await http.get(Uri.parse(url));
    var deco=jsonDecode(response.body.toString());

    if(response.statusCode==200){

        data=deco;

    }else{
      
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('store data in data instead of list '),
        ),
      ),
      body:  Center(
        child: Column(
          children: [
            Expanded(
                child:FutureBuilder(
                  future: getData(),
                  builder: (context,snapshot){
                      //variable nile thik same condition use korte hobe
                      if(snapshot.connectionState==ConnectionState.waiting){
                        return Text("Loading..");
                      }else{
                        return ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context,index)=>Card(
                              child: Column(
                                children: [
                                  Reusable(title: 'User Name : ', value: data![index]['username'].toString()),
                                  Reusable(title: 'Email : ', value: data![index]['email'].toString()),
                                  Reusable(title: 'Address : ', value: data![index]['address']['geo']['lng'].toString())
                                ],
                              ),
                            )
                        );
                      }
                  }
                )
            )
          ],
        ),
      ),
    );
  }
}
class Reusable extends StatelessWidget {
  String title,value;
Reusable({required this.title,required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
    child: Row(
        children: [
          Text(title),
          Text(value)
      ],
    ),
    );
  }
}
