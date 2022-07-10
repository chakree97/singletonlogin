import 'package:flutter/material.dart';
import 'package:singleton/model/token.dart';

class PageTwo extends StatelessWidget {
  const PageTwo(
    {
      Key? key,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent.shade400,
        title: const Text("Page Two By Singleton"),
      ),
      body: Center(
        child: Text(TokenSingleTon().getToken),
      ),
    );
  }
}