import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_api/Model/PostModel.dart';
import 'package:http/http.dart' as http;
import 'package:http_status_code/http_status_code.dart';
class Get_Api extends StatefulWidget {
  const Get_Api({Key? key}) : super(key: key);

  @override
  State<Get_Api> createState() => _Get_ApiState();
}

class _Get_ApiState extends State<Get_Api> {
    // List<PostModel> postList=[];
  var data;
  Future<PostModel> getData() async {
    var url = "https://jsonplaceholder.typicode.com/photos";
    var response = await http.get(Uri.parse(url));
    var deco = jsonDecode(response.body.toString());
    print(deco);
    if (response.statusCode==200) {
      // for (Map i in data) {
      //   postList.add(PostModel.fromJson(i));
      // }
        this.data=deco;
      return PostModel.fromJson(data);
    }else{
      return PostModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Get Api Example'),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: getData(),
                builder: (context,snapshot){
                  if(snapshot.hasData){

                    return ListView.builder(
                        itemCount: data.length,
                        itemBuilder:(context,index)=>Card(
                          child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                          ListTile(
                                          title: Text(this.data![index].shop!.name.toString()),
                                          subtitle: Text(this.data![index].shop!.shopemail.toString()),
                                          leading: CircleAvatar(
                                          backgroundImage: NetworkImage(this.data![index].shop!.image.toString()),
                                          ),
                                          ),
                                          Container(
                                          height: MediaQuery.of(context).size.height *.3,
                                          width: MediaQuery.of(context).size.width * 1,
                                          child: ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          itemCount: this.data![index].images!.length,
                                          itemBuilder: (context, position){
                                          return Padding(
                                          padding: const EdgeInsets.only(right: 10),
                                          child: Container(
                                          height: MediaQuery.of(context).size.height *.25,
                                          width: MediaQuery.of(context).size.width * .5,
                                          decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(data![index].images![position].url.toString())
                                          )
                                          ),
                                          ),
                                          );
                                          }),
                                          ),
                                          Icon(data![index].inWishlist! == false ? Icons.favorite : Icons.favorite_outline)
                                          ],
                                          ),
                        ),


                  );
                                          }
                                       else {
                                          return CircularProgressIndicator();
                                          }
                                        },
                                        ),
                                        )
                                        ],
                                        ),
                                        ),
                                        );
}
}