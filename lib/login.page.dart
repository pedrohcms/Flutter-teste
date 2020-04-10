import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/reset-password.page.dart';
import 'services/Api.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailFieldController = TextEditingController();
  final passwordFieldController = TextEditingController();

  Future<void> _showDialogBox() async {
    return showDialog<void>(
        context: context,
        builder: (BuildContext contex) {
          return AlertDialog(
            title: Text("Usuário não encontrado"),
            content: Text("Usuário não está cadastrado ou credenciais erradas"),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ), //ajuste do padding
        color: Colors.white, //cor de fundo
        child: ListView(
          children: <Widget>[
            SizedBox(
                width: 328,
                height: 328,
                child: Image(
                  image: AssetImage('images/logo.png'),
                )),
            SizedBox(
              height: 20,
            ), //espaço entre a imagem e o campo de texto
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "E-mail",
                labelStyle: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(fontSize: 20),
              controller: emailFieldController,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(fontSize: 20),
              controller: passwordFieldController,
            ),
            Container(
              height: 40,
              alignment: Alignment.centerRight,
              child: FlatButton(
                child: Text(
                  "Recuperar Senha",
                  textAlign: TextAlign.right,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      //rota para outra página
                      builder: (context) => ResetPasswordPage(),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.bottomRight,
                  stops: [0.3, 1],
                  colors: [
                    Color.fromRGBO(0, 0, 255, 100),
                    Color.fromRGBO(0, 0, 139, 100),
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(3),
                ),
              ),
              child: SizedBox.expand(
                child: FlatButton(
                    child: Text(
                      "Entrar",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () async {
                      print(
                          'Email: ${emailFieldController.text} and password: ${passwordFieldController.text}');

                      await Api.sendRequest('POST', '/session', {
                        "email": emailFieldController.text,
                        "password": passwordFieldController.text
                      });

                      if (Api.content.containsKey("error")) {
                        print("Error connectiong with API");
                        print(
                            "The error was:" + Api.content["error"].toString());
                      } else {
                        if (Api.content.containsKey("token")) {
                          Navigator.of(context).popAndPushNamed('/user_page',
                              arguments: {
                                "email": emailFieldController.text,
                                "token": Api.content["token"]
                              });
                        } else {
                          _showDialogBox();
                        }
                      }
                    }),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.bottomRight,
                  stops: [0.3, 1],
                  colors: [
                    Color.fromRGBO(0, 0, 255, 100),
                    Color.fromRGBO(0, 0, 139, 100),
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(3),
                ),
              ),
              child: SizedBox.expand(
                child: FlatButton(
                    child: Text(
                      "Criar Conta",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () {}),
              ),
            ),
          ],
        ), //o listView serve para fixar as coisas na página(teclado sobresair)
      ),
    );
  }
}
