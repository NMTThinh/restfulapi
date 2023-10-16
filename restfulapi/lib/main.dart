import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title:'Resful API DIO',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}
 class MyHomePage extends StatefulWidget{
  const MyHomePage({Key? key}) : super(key: key);

  @override
   State<MyHomePage> createState() => _MyHomePageState();
 }

 class _MyHomePageState extends State<MyHomePage>{

   String _getData = '';
   String _postData = '';

  @override

 void getData() async{
    try{
      var response = await Dio().get('https://jsonplaceholder.typicode.com/todos/1');
      setState(() {
        _getData = json.encode(response.data);
      });
    }catch(e){
      print(e.toString());
    }
  }
  void postData() async{
    try{
      var response = await Dio().get('https://jsonplaceholder.typicode.com/posts',
      data: {'name':'NMTThinh','email':'nguyentruongthinh780@gmail.com'});
      setState(() {
        _postData = json.encode(response.data);
      });
    }catch(e){
      print(e.toString());
    }
  }
  @override
   Widget build (BuildContext context){
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 500,
                height: 100,
                color: Colors.lightBlueAccent,
                padding: EdgeInsets.only(top: 40,left: 7),
                child: Text('Restful API',style: TextStyle(fontSize: 30,color: Colors.white),),
              ),
              ElevatedButton(
                  onPressed: getData,
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.lightBlueAccent,
                    foregroundColor: Colors.black
                  ),
                  child: const Text('Get Data')),

              Container(
                width: 300,
                padding: const EdgeInsets.all(50),
                child: Text(_getData),
              ),

              ElevatedButton(
                  onPressed: postData,
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.lightBlueAccent,
                      foregroundColor: Colors.black
                  ),
                  child: const Text('Post Data')),

              Container(
                width: 300,
                padding: const EdgeInsets.all(50),
                child: Text(_postData),
              ),
            ],
          ),
        ),
      )
    );
  }
 }