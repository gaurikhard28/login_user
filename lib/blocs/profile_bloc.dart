import 'dart:async';
import 'package:login_user/models/profile_models.dart';

import 'lib/models/profile_models.dart';

import 'package:login_user/blocs/signup_bloc.dart';

abstract class profile_event{}

enum ProfileAction{Add, Delete, Update,Fetch }

class ProfileBloc {
  late final int phone;
  late final String? Name;
  late final String? email;
  late final String? address;

  final _stateStreamController = StreamController<String>();
  StreamSink<String> get _profileSink => _stateStreamController.sink;
  Stream<String> get _profileStream => _stateStreamController.stream;

  final _eventStreamController = StreamController<ProfileAction>();
  StreamSink<ProfileAction> get eventSink => _eventStreamController.sink;

  Stream<ProfileAction> get _eventStream => _eventStreamController.stream;

  ProfileBloc() {
    _eventStream.listen((event) {
      if (event == ProfileAction.Add) {
        insertUser(phone, Name, email, address);
      }
      else if (event == ProfileAction.Delete) {
        deleteUser();
      }
      else if (event == ProfileAction.Update) {

      }
      else if (event == ProfileAction.Fetch) {

      }
    });
    void insertUser(int phone, String Name,String email, String address) {
      user.insert(index, user);
      key.currentState.insertItem(index);
    }
      void deleteUser(int index) {
        final item = user.removeAt(index);

        key.currentState.deleteUser(
          index),
        );
      }
    void dispose() {
      _stateStreamController.close();
      _eventStreamController.close();
    }

}
}