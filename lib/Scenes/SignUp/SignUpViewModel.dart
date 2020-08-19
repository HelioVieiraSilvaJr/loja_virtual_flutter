import 'package:loja_virtual_flutter/Commons/Model/User.dart';
import 'package:loja_virtual_flutter/Scenes/SignUp/Repository/SignUpRepository.dart';

class SignUpViewModel {

  final SignUpRepository _repository = SignUpRepository();

  Future<void> signUp({User user, Function onSuccess, Function onFail}) async {
    _repository.signUp(
      user: user,
      onSuccess: onSuccess,
      onFail: onFail
    );
  }
}