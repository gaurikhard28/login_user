abstract class signup_event{}

class LoginContactChanged extends signup_event{
  late final String contact;
  LoginContactChanged({required this.contact});
}

class LoginPasswordChanged extends signup_event{
  late final String password;
  LoginPasswordChanged({required this.password});
}
class LoginNameChanged extends signup_event{
  late final String name;
  LoginNameChanged({required this.name});
}



class LoginSubmitted extends signup_event{

}