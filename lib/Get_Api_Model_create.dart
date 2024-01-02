import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart ' as http;
import 'package:http_status_code/http_status_code.dart';
class Api_Model_Creaste extends StatefulWidget {
  const Api_Model_Creaste({Key? key}) : super(key: key);

  @override
  State<Api_Model_Creaste> createState() => _Api_Model_CreasteState();
}

class _Api_Model_CreasteState extends State<Api_Model_Creaste> {
  List<photos> photoList=[];
  Future<List<photos>> getPhotoData()async{
    var url="https://jsonplaceholder.typicode.com/photos";
    var response=await http.get(Uri.parse(url));
    var data=jsonDecode(response.body.toString());

    if(response.statusCode==200){
      for(Map i in data){
        photos photo=photos(title:i['title'],url:i['url'], id:i['id']);
        photoList.add(photo);
      }
      return photoList;
    }
    return photoList;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Get Api Example without Model'
          ),
        ),
      ),
      body: Center(

            child: Expanded(
              child: FutureBuilder(
                future: getPhotoData(),
                builder: (context,snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  } else {
                    return ListView.builder(
                        itemCount: photoList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  snapshot.data![index].url.toString()),
                            ),
                            title: Text(snapshot.data![index].id.toString()),
                            subtitle: Text(photoList[index].title.toString()),
                          );
                        }
                    );
                  }
                }
              ),
            ),
          ),


    );
  }
}

class photos{
  String title,url;
  int id;
  photos({required this.title,required this.url, required this.id});
}
