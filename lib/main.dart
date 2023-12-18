
import 'package:advancedproject/pages/home.pages.dart';
import 'package:advancedproject/pages/signin.pages.dart';
import 'package:advancedproject/services/preferences.services.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  try{
    PreferencesService.prefs = await SharedPreferences.getInstance();
    if (PreferencesService.prefs != null){
      print("preferences init successfully");
    }
  }
  catch (e){print("error in init preferences");}
  // PreferencesService.prefs = await SharedPreferences.getInstance();
  // var prefs;
  // int users = prefs.getInt("count")??0;
  // print(users);

  retrieveStringValue ();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
    void initState(){
      var un = retrieveStringValue ();
    }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
          backgroundColor: Colors.deepOrange,
          splashIconSize: 300,
          pageTransitionType: PageTransitionType.leftToRight,
          //splashTransition: SplashTransition.decoratedBoxTransition,
          splash: Column(
            children: [
              Container(child: Icon(Icons.fastfood , weight:200 ,), height: 200,),
              // Image.asset(
              //   "images/hm.png",
              //   width: 200,
              //   height: 200,
              // ),
              SizedBox(height: 10),
              Text(
                "Your Meal", style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 32,
                  color: Colors.white,
                ),
              ),
            ],
          ),
            nextScreen:chk(checkKey()),
            //signin(),
            //check(),
        ));
  }
}
StatefulWidget chk (var wh){
  retrieveStringValue ();
  if (wh == true){
    return home();
  } else return signin();
}