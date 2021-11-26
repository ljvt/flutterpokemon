import 'package:mobx/mobx.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  _LoginStoreBase() {
    autorun((p0) {
      // ignore: avoid_print
      print(email);
      // ignore: avoid_print
      print(senha);
    });
  }

  @observable
  String email = '';
  @observable
  String senha = '';
  @observable
  bool senhaVisivel = false;

  @action
  void setEmail(String value) => email = value;

  @action
  void setSenha(String value) => senha = value;

  @action
  void setSenhaVisival() => senhaVisivel = !senhaVisivel;
}
