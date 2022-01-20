abstract class login_event{}

class LoginContactChanged extends login_event{
  late final String contact;
  LoginContactChanged({required this.contact});
}

class LoginPasswordChanged extends login_event{
  late final String password;
  LoginPasswordChanged({required this.password});
}

class LoginSubmitted extends login_event{

}