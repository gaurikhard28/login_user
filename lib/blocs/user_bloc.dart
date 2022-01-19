import 'package:login_user/resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:login_user/models/signup_models.dart';

class UserBloc {
  Repository repository_ = Repository();
  PublishSubject<User> userDetail_ = PublishSubject<User>();

  UserBloc({
    required this.userDetail_,
    required this.repository_,
  })
      : assert(userDetail_ != null),
        assert(userDetail_ != null)

}

