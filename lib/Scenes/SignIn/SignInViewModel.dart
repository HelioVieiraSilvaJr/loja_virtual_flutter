import 'package:loja_virtual_flutter/Commons/Model/User.dart';
import 'package:loja_virtual_flutter/Scenes/SignIn/Repository/SignInRepository.dart';

class SignInViewModel {

  final _repository = SignInRepository();

  Future<void> singIn({User user, Function onSuccess, Function onFail}) async {
    _repository.singIn(
      user: user,
      onSuccess: onSuccess,
      onFail: onFail
    );
  }
}