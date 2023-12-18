import 'package:advancedproject/pages/signin.pages.dart';
import 'package:advancedproject/services/preferences.services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home.pages.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final fun = TextEditingController();
  final fpw = TextEditingController();
  bool isvisible = true;
  bool isempty = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
    Container(color: Colors.deepOrange,
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [Padding(
          padding: const EdgeInsets.only(left:50,top:0,right:50,bottom:0),
          child: TextField(
            controller: fun,
            decoration: InputDecoration(
                label: Row(
                  children: [
                    Icon(Icons.person),
                    Text("username", style: TextStyle(color: Colors.white),),
                  ],
                ),
                enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.white12)),
            filled: true , fillColor: Colors.white54),

          ),
        ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left:50,top:0,right:50,bottom:0),
            child: TextField(
              controller: fpw,
              decoration: InputDecoration(
                  label: Row(
                    children: [
                      Icon(Icons.lock),
                      Text("password", style: TextStyle(color: Colors.white),),
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
          SizedBox(height:20),
          Padding(
            padding: const EdgeInsets.only(left:50,top:0,right:50,bottom:0),
            child: Row(mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: (){
                  if(fun.text.isNotEmpty&&fpw.text.isNotEmpty){
                    saveStringValue();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> home()));}
                  else{
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> AlertDialog(
                      title: Text("That's Require"),icon:Icon(Icons.error),
                    )));
                  }
                }, child: Card(child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text("Signin",style: TextStyle(color: Colors.orange),),
                ))),
                TextButton(onPressed: (){
                  fun.clear();fpw.clear();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>signin()));
                }, child: Card(child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text("Cancel", style: TextStyle(color: Colors.orange),),
                )))
              ],),
          )
        ],),
    )
      ,);
  }
}
