import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_api/Model/ComplexJson.dart';
import 'package:http/http.dart' as dart;
class Complex_Json_Api extends StatefulWidget {
  const Complex_Json_Api({Key? key}) : super(key: key);

  @override
  State<Complex_Json_Api> createState() => _Complex_Json_ApiState();
}

class _Complex_Json_ApiState extends State<Complex_Json_Api> {
   List<ComplexJson> complexList=[];
   Future<List<ComplexJson>> getComplexData()async{
     var url="https://jsonplaceholder.typicode.com/users";
     var response=await dart.get(Uri.parse(url));
     var data=jsonDecode(response.body.toString());
     if(response.statusCode==200){
       for(Map i in data){
         complexList.add(ComplexJson.fromJson(i));
       }
       return complexList;
     }else{
       return complexList;
     }
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Center(
          child: Text('Complex Json Handle with api'),
        )

      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
                child:FutureBuilder(
                  future: getComplexData(),
                  builder: (context,snapshot){
                    if(!snapshot.hasData){
                      return CircularProgressIndicator();
                    }
                    else{
                      return ListView.builder(
                          itemCount: complexList.length,
                          itemBuilder: (complex,index){
                            return Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                      ReusableRow('Name:',snapshot.data![index].name.toString() ),
                                      ReusableRow('User Name:', snapshot.data![index].username.toString()),
                                      ReusableRow('Email:', complexList[index].email.toString()),
                                    ReusableRow('Address', complexList[index].address!.geo!.lat!.toString()),

                                  ],
                                ),
                              )
                            );

                          }
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
class ReusableRow extends StatelessWidget {
  String title,value;
 ReusableRow(this.title,this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child:ListTile(
          title: Text(title),
          subtitle: Text(value),
        )
    );
  }
}

