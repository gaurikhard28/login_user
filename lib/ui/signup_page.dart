import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:login_user/ui/profile_page.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class signuo_page extends StatefulWidget {
  const signuo_page({Key? key}) : super(key: key);

  @override
  _signuo_pageState createState() => _signuo_pageState();
}

class _signuo_pageState extends State<signuo_page> {

  bool isLoading= false;
  final _contactController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        backgroundColor: Colors.amber,
        body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Center(
            child: Text(" Sign Up ",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w900,
                color: Colors.black,

              ),),
          ),
          const SizedBox(
            height: 20,
          ),
          ContactField(),
          const SizedBox(
            height: 20,
          ),
          PasswordField(),
          const SizedBox(
            height: 20,
          ),
          NameField(),
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: Text(" Log In ? ",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),),
          ),
          const SizedBox(
            height: 40,
          ),
            Container(
              height: 80,
              padding: EdgeInsets.only(left: 25, right: 25, bottom: 20),
              width: 364,
              child: ElevatedButton(
               onPressed: () {
               setState(() {
                 isLoading= true;
               });
               sign(_contactController.text,_passwordController.text,_nameController.text);
               },
    style: ElevatedButton.styleFrom(
    primary: Colors.black,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10.0),
    ),
    ),

    child: const Text(" Sign In ",
    style: TextStyle(
    fontSize: 25,
    color: Colors.white,
    ),
    ),

    ),
    ),
    ],
    ),
    ),

    );

  }
  sign(String contact,String password, String name ) async {
    Map data = {
      'contact': contact,
      'password': password,
      'name': name
    };
    var jsonDate = null;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    isLoading = false;
    var response = await http.post(Uri.parse(
        'https://sandbox.9930i.com/central/register'));
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      jsonDate = json.decode(response.body);
      setState(() {
        sharedPreferences.setString('token', jsonDate('token'));
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
            builder: (BuildContext context) => profile_page()), (
            Route<dynamic> route) => false);
      });
    }
    else
      print(response.body);
  }
  Widget ContactField(){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(

        decoration: InputDecoration(labelText: 'Phone'),
        controller: _contactController,

      ),
    );
  }
  Widget PasswordField(){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        decoration: InputDecoration(labelText: 'Password'),
        controller: _passwordController,
      ),
    );
  }
  Widget NameField(){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(

        decoration: InputDecoration(labelText: 'Name'),
        controller: _nameController,

      ),
    );
  }

}
