import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'signup_page.dart';

class profile_page extends StatefulWidget {
  const profile_page({Key? key}) : super(key: key);

  @override
  _profile_pageState createState() => _profile_pageState();
}

class _profile_pageState extends State<profile_page> {
  late SharedPreferences sharedPreferences;
  @override
  void initState(){
    super.initState();
    checkLoginStatus();

  }
  checkLoginStatus() async{
    sharedPreferences=await SharedPreferences.getInstance();
    if (sharedPreferences.getString("token")== null) {
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
          builder: (BuildContext context) => const signuo_page()), (
          Route<dynamic> route) => false);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar:AppBar(
           backgroundColor: Colors.amber,

           title: const Text("Profile",
             style: TextStyle(
               fontSize: 20,
               color: Colors.white,
             ),),
           centerTitle: true,
           actions: <Widget>[
             IconButton(
               onPressed: () {},
               icon: const Icon(Icons.person_add_rounded,
                 color: Colors.white,),
             ),
             FlatButton(
               onPressed: () {
                 sharedPreferences.clear();
                 sharedPreferences.commit();
                 Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                     builder: (BuildContext context) => const signuo_page()), (
                     Route<dynamic> route) => false);
               },
                child: const Text("Log Out", style: TextStyle(color: Colors.white),),
             ),],
           ),
      body: Container(
        color: Colors.white,

      ),

    );
  }
}
