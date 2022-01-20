import 'package:login_user/blocs/login_form_submission.dart';

class UserLogin {
  final String contact;
  final String password;
  final login_form_submission formStatus;


  UserLogin({
    this.password='',
    this.contact='',
    this.formStatus= const InitialFormStatus()
});

  UserLogin copyWith({
     String? contact,
     String? password,
     login_form_submission? formStatus,
}){
    return UserLogin(
      contact:contact ?? this.contact,
      password:password??this.password,
        formStatus: formStatus??this.formStatus,
    );
  }
}