
import 'package:shared_preferences/shared_preferences.dart';

//singelton
abstract class PreferencesService {
   static SharedPreferences? prefs ;
}
var prefs ;
// bool hasKey;
saveStringValue () async {
   prefs = await SharedPreferences.getInstance();
   prefs.setString ("keyusername","fun");
   prefs.setString ("keypassword","fpw");
}
saveBoolValue () async {
   prefs = await SharedPreferences.getInstance();
   prefs.setBool("keyloggedin",true);
}
retrieveStringValue () async {
   prefs = await SharedPreferences.getInstance();
   String value =prefs.getString ("keyusername");
   print(value);
   String valu =prefs.getString ("keypassword");
   print(valu);
}
retrieveBooleanValue () async {
   prefs = await SharedPreferences.getInstance();
   bool value = prefs.getBool ("keyloggedin");
   print (value);
}
checkKey () async {
   prefs = await SharedPreferences.getInstance();
   bool hasKey = prefs.containsKey ("keyusername");
   print(hasKey);
}
deleteValue () async {
   prefs = await SharedPreferences.getInstance();
   prefs.remove("keyusername");
}
