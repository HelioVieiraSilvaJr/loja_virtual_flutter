import 'package:flutter/material.dart';
import 'package:loja_virtual_flutter/Commons/Helpers/Validators.dart';
import 'package:loja_virtual_flutter/Commons/Model/User.dart';
import 'SignInViewModel.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  SignInViewModel viewModel = SignInViewModel();
  bool _isLoading = false;
  TextEditingController emailController = TextEditingController(text: "helio@email.com");
  TextEditingController passwordController = TextEditingController(text: "123456");
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();

  void setLoading(bool value) {
    setState(() {
      _isLoading = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldState,
      appBar: AppBar(
        title: Text("Entrar"),
        actions: <Widget>[
          FlatButton(
            onPressed: (){
              Navigator.of(context).pushReplacementNamed('/signup');
            },
            textColor: Colors.white,
            child: Text("CRIAR CONTA"),
          )
        ],
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(16),
              children: <Widget>[
                TextFormField(
                  controller: emailController,
                  enabled: !_isLoading,
                  decoration: InputDecoration(hintText: "E-mail"),
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  validator: (email) {
                    if(!emailValid(email))
                      return "E-mail inválido!";
                    return null;
                  },
                ),
                const SizedBox(height: 16,),
                TextFormField(
                  controller: passwordController,
                  enabled: !_isLoading,
                  decoration: InputDecoration(hintText: "Senha"),
                  autocorrect: false,
                  obscureText: true,
                  validator: (password) {
                    if (password.isEmpty || password.length < 6)
                      return "senha inválida!";
                    return null;
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: () {

                    },
                    padding: EdgeInsets.zero,
                    child: const Text("Esqueci minha senha"),
                  ),
                ),
                const SizedBox(height: 16,),
                SizedBox(
                  height: 44,
                  child: RaisedButton(
                    onPressed: _isLoading ? null : () {
                      if(formKey.currentState.validate()) {
                        setLoading(true);
                        User user = User(
                            email: emailController.text,
                            password: passwordController.text
                        );
                        viewModel.singIn(
                            user: user,
                            onSuccess: () {
                              setLoading(false);
                              Navigator.of(context).pop();
                            },
                            onFail: (e) {
                              setLoading(false);
                              scaffoldState.currentState.showSnackBar(
                                  SnackBar(
                                    content: Text("Falha ao entrar: $e"),
                                    backgroundColor: Colors.red,
                                  )
                              );
                            }
                        );
                      }
                    },
                    color: Theme.of(context).primaryColor,
                    disabledColor: Theme.of(context).primaryColor.withAlpha(100),
                    textColor: Colors.white,
                    child: _isLoading ?
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                    ) :
                    Text("Entrar",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
