import 'package:flutter/material.dart';

class profile_page extends StatefulWidget {
  const profile_page({Key? key}) : super(key: key);

  @override
  _profile_pageState createState() => _profile_pageState();
}

class _profile_pageState extends State<profile_page> {
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
           actions: [
             IconButton(
               onPressed: () {},
               icon: Icon(Icons.person_add_rounded,
               color: Colors.white,),
             ),],
           ),
      body: Container(
        color: Colors.white,

      ),

    );
  }
}
