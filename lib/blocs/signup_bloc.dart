import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '';

enum SignAction{Submit}

class SignBloc {
  late String name;
  late String contact;
  late String password;
  final _stateStreamController = StreamController<String>();

  StreamSink<String> get _signSink => _stateStreamController.sink;

  Stream<String> get _signStream => _stateStreamController.stream;

  final _eventStreamController = StreamController<SignAction>();

  StreamSink<SignAction> get eventSink => _eventStreamController.sink;

  Stream<SignAction> get _eventStream => _eventStreamController.stream;


  SignBloc() {
    _eventStream.listen((event) {
      if (event == SignAction.Submit) {
        sign(String contact,String password, String name ) async {
          Map data = {
            'contact': contact,
            'password': password,
            'name': name
          };
          var jsonDate = null;
          SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
          var response = await http.post(Uri.parse(
              'https://sandbox.9930i.com/central/register'));
          if (response.statusCode == 200) {
            // If the call to the server was successful, parse the JSON
            jsonDate =  json.decode(response.body);

          }
          else
            print(response.body);
        }
      }
      _signSink.add(name);
    });
  }
  void dispose(){
    _stateStreamController.close();
    _eventStreamController.close();
  }

  sign(String contact,String password, String name ) async {
    Map data = {
      'contact': contact,
      'password': password,
      'name': name
    };
}}