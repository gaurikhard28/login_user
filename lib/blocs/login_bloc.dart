import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_user/blocs/login_event.dart';
import 'package:login_user/blocs/login_form_submission.dart';
import 'package:login_user/models/login_models.dart';
import 'package:login_user/resources/repository.dart';
import 'login_event.dart';


class login_bloc extends Bloc<login_event,UserLogin>{
  final Repository repository;
  login_bloc(this.repository): super(UserLogin());

  @override
  Stream<UserLogin> mapEventToState(login_event event) async* {
  if (event is LoginContactChanged){
    yield state.copyWith(contact: event.contact, password: '', formStatus: );
  }
  else if (event is LoginPasswordChanged){
    yield state.copyWith(password: event.password, formStatus: null, contact: '');
  }
  if (event is LoginSubmitted){
    yield state.copyWith(formStatus: FormSubmitting(), contact: '', password: '');
    try{
      await repository.login();
      yield state.copyWith(contact: '', password: 
          '', formStatus: SubmissionSuccess());
      
    }
    catch(e){
      yield state.copyWith(contact: '', password:
      '', formStatus: SubmissionFailed(e));
    }
  }
  }
}


