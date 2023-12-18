
import 'package:advancedproject/pages/signup.pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home.pages.dart';

class signin extends StatefulWidget {
  signin({super.key});

  @override
  State<signin> createState() => signinState();
}

class signinState extends State<signin> {
  final un = TextEditingController();
  final pw = TextEditingController();
  bool isvisible = true;

  var retrieveStringValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
        Container(color: Colors.deepOrange,
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [Padding(
              padding: const EdgeInsets.only(left:50,top:0,right:50,bottom:0),
              child: TextField(
                controller: un,
                decoration: InputDecoration(
                    label: Row(
                  children: [
                    Icon(Icons.person),
                    Text("username",style: TextStyle(color: Colors.white,),),
                  ],
                ),

                    enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.white12),),
                filled: true , fillColor: Colors.white54),

              ),
            ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left:50,top:0,right:50,bottom:0),
                child: TextField(
                  controller: pw,
                  decoration: InputDecoration(
                      label: const Row(
                        children: [
                          Icon(Icons.lock),
                          Text("password",style: TextStyle(color: Colors.white),),
                        ],
                      ),
                      enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.white12)),
                      filled: true, fillColor: Colors.white54,
                      suffixIcon: IconButton(icon: Icon(isvisible? Icons.visibility:Icons.visibility_off),
                        color: Colors.orange,
                        onPressed: (){
                          setState(() {
                            isvisible = !isvisible;
                          });
                        },)),
                  obscureText: isvisible,
                ),
              ),
              const SizedBox(height:20),
              Padding(
                padding: const EdgeInsets.only(left:50,top:0,right:50,bottom:0),
                child: Row(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(onPressed: (){
                      final String? keyusername = retrieveStringValue.value();
                      pg(keyusername);
                      //Navigator.push(context, MaterialPageRoute(builder: (context)=> home()));
                    }, child: const Card(child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Text("Signin", style: TextStyle(color: Colors.orange),),
                    ))),
                    TextButton(onPressed: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>const signup()));
                    }, child: const Card(child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Text("Signup", style: TextStyle(color: Colors.orange),),
                    )))
                  ],),
              )
            ],),
        )
    );
  }
}StatefulWidget pg (var p){
  var keyusername;
  if (keyusername==null){
    return signup();
  }else return home();
}
