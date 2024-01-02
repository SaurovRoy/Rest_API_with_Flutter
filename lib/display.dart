import 'package:flutter/material.dart';
import 'package:get_api/Complex_Json_Api.dart';
import 'package:get_api/upload_image.dart';
import 'package:get_api/variable_api.dart';

import 'Get_Api_Model_create.dart';
class Display extends StatelessWidget {
  const Display({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Rest Api'),
      ),
      body: Column(
        children: [
          SizedBox(height: 50,),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>
              Vaibale_Api()
            ));
          }
              , child: Center(
                child: Text('Variable Api'),
              )
          ),
          SizedBox(height: 50,), ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>
                Api_Model_Creaste()
            ));
          }
              , child: Center(
                child: Text('Api Model Create'),
              )
          ),
          SizedBox(height: 50,),

          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>
              Complex_Json_Api()
            ));
          }
              , child: Center(
                child: Text('Complex Json Api'),
              )
          ),
          SizedBox(height: 50,),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>
                upload_Image()
            ));
          }
              , child: Center(
                child: Text('Upload Image'),
              )
          ),
          SizedBox(height: 50,),

        ],
    ),
    );
  }
}
