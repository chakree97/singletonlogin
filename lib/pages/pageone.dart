import 'package:flutter/material.dart';
import 'package:singleton/model/token.dart';
import 'package:singleton/pages/pagetwo.dart';

class PageOne extends StatelessWidget {
  const PageOne(
    {
      Key? key,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent.shade400,
        title: Text(TokenSingleTon().getToken),
      ),
      body: const Center(
        child: Text("This is page one by singleton."),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
           Navigator.push(context,MaterialPageRoute(builder: (context)=> const PageTwo()));
        },
        backgroundColor: Colors.orangeAccent.shade400,
        child: const Icon(Icons.send),
      ),
    );
  }
}