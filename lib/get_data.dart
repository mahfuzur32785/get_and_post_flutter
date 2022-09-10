import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  var _getData = [];
  
  void fetchData() async{
    try{
      final response = await get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
      final jsonData = jsonDecode(response.body);
      setState(() {
        _getData = jsonData;
      });
    } catch(e){}
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http Request'),
      ),
      body: Container(
        child: Center(
          child: ListView(
            children: [
              Center(
                child: Text('Fetched data:',style: TextStyle(
                  fontSize: 20,

                ),),
              ),
              SizedBox(height: 10,),
              Container(
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.all(20),
                color: Colors.grey,
                child: ListView.builder(
                  itemCount: _getData.length,
                  itemBuilder: (context, index) {
                    //final data = _getData[index];
                    return Column(
                      children: [
                        Text("Title: ${_getData[index]["title"]}"),
                        Text("Body: ${_getData[index]["title"]}"+"\n\n"),
                      ],
                    );
                  }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
