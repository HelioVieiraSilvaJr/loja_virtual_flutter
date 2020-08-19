import 'package:flutter/material.dart';
import 'package:loja_virtual_flutter/Commons/Helpers/Validators.dart';
import 'package:loja_virtual_flutter/Commons/Model/User.dart';

import 'SignUpViewModel.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  SignUpViewModel viewModel = SignUpViewModel();
  bool _isLoading = false;
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _repeatPasswordController = TextEditingController();
  GlobalKey<FormState> _formState = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  User _user = User();

  void setLoading(bool value) {
    setState(() {
      _isLoading = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        title: Text("Criar Conta"),
      ),
      body: Center(
        child: Form(
          key: _formState,
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              padding: EdgeInsets.all(16),
              shrinkWrap: true,
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(hintText: "Nome"),
                  enabled: !_isLoading,
                  validator: (name){
                    if(name.isEmpty) return "Campo obrigatório";
                    else if(name.length < 4) return "Nome inválido!";
                    return null;
                  },
                  onSaved: (name) => _user.name = name,
                ),
                SizedBox(height: 16,),
                TextFormField(
                  decoration: const InputDecoration(hintText: "E-mail"),
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  enabled: !_isLoading,
                  validator: (email){
                    if(email.isEmpty) return "Campo obrigatório";
                    else if(!emailValid(email)) return "E-mail inválido!";
                    return null;
                  },
                  onSaved: (email) => _user.email = email,
                ),
                SizedBox(height: 16,),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(hintText: "Senha"),
                  obscureText: true,
                  enabled: !_isLoading,
                  validator: (password){
                    if(password.isEmpty) return "Campo obrigatório";
                    else if(password.length < 4) return "Senha inválida!";
                    return null;
                  },
                  onSaved: (password) => _user.password = password,
                ),
                SizedBox(height: 16,),
                TextFormField(
                  controller: _repeatPasswordController,
                  decoration: const InputDecoration(hintText: "Repita a senha"),
                  obscureText: true,
                  enabled: !_isLoading,
                  validator: (password){
                    String curPassword = _passwordController.text;
                    if(password.isEmpty) return "Campo obrigatório";
                    else if(password.length < 4) return "Senha inválida!";
                    else if(password != curPassword) return "Senhas não coincidem!";
                    return null;
                  },
                ),
                SizedBox(height: 16,),
                SizedBox(
                  height: 44,
                  child: RaisedButton(
                    onPressed: (){
                      if(_formState.currentState.validate()) {
                        setLoading(true);
                        _formState.currentState.save();
                        viewModel.signUp(
                          user: _user,
                          onSuccess: (){
                            setLoading(false);
                            Navigator.of(context).pop();
                          },
                          onFail: (e) {
                            setLoading(false);
                            _scaffoldState.currentState.showSnackBar(
                              SnackBar(
                                content: Text("Falha ao cadastrar: $e"),
                                backgroundColor: Colors.red,
                              )
                            );
                          }
                        );
                      }
                    },
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    child: _isLoading ?
                        CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                        ) :
                        Text("Criar Conta",
                          style: TextStyle(
                              fontSize: 18
                          ),
                        )
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
