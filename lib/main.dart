import 'package:flutter/material.dart';
import 'package:singleton/model/token.dart';
import 'package:singleton/pages/pageone.dart';
import 'package:singleton/service/fetchapi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage()
    );
  }
}

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             const Text("Login Page After Singleton",
              style: TextStyle(
                fontSize: 18
              ),
             ),
             const SizedBox(
               height: 30,
             ),
             Container(
              width: width,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20)
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: username,
                decoration: const InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  border: InputBorder.none,
                  labelText: 'Username',
                  labelStyle: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  )
                ),
              ),
            ),
            const SizedBox(
               height: 20,
             ),
             Container(
              width: width,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20)
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: password,
                decoration: const InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  border: InputBorder.none,
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  )
                ),
              ),
            ),
            const SizedBox(
               height: 60,
             ),
            InkWell(
              onTap: ()async{
                var res = await login(username.text, password.text);
                if(res.message == "Successful"){
                  TokenSingleTon().setToken(res.token!);
                  showDialog(
                    context: context, 
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Authentication Successful'),
                      actions: [
                        TextButton(
                          onPressed: (){
                            Navigator.pop(context);
                            Navigator.push(context,MaterialPageRoute(builder: (context)=> const PageOne()));
                          }, child: const Text("OK")
                        )
                      ],
                    )
                  );
                }
              },
              child: Container(
                width: width,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.orangeAccent.shade400,
                  borderRadius: BorderRadius.circular(20.0)
                ),
                child: const Center(
                  child: Text('Login',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}