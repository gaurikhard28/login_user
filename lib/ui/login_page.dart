import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_user/blocs/login_bloc.dart';
import 'package:login_user/models/login_models.dart';
import 'package:login_user/resources/repository.dart';
import 'package:login_user/ui/profile_page.dart';

class login_page extends StatefulWidget {
  const login_page({Key? key}) : super(key: key);

  @override
  _login_pageState createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  final _contactController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isLoading= false;

  @override
  Widget build(BuildContext context) {
    final formKey= GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.amber,
      body: BlocProvider(
        create: (context)=>
            login_bloc(
              repository: context.read<Repository>(),
            ),

      child: Form(
        key: formKey,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:  [
              Text(" Log In ",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,

                ),),
              ContactField(),
              PasswordField(),
              Text(" Sign Up? ",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,

                ),),
              Container(
                height: 80,
                padding: EdgeInsets.only(left: 25, right: 25, bottom: 20),
                width: 364,
                child: ElevatedButton(
                  onPressed: () {
                     isLoading= true;

                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),

                  child: Text(" Log In ",
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
      ),
      ),
    );
  }
    Widget ContactField(){
      return TextFormField(

          decoration: InputDecoration(labelText: 'Phone'),
          controller: _contactController,
        validator: (value)=>null,
      );
    }
  Widget PasswordField(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Password'),
      controller: _passwordController,
      validator: (value)=>null,
    );
  }

}
