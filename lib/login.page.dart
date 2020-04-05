import 'package:flutter/material.dart';
import 'package:flutterapp/reset-password.page.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ) ,//ajuste do padding
        color: Colors.white, //cor de fundo
        child: ListView(
          children: <Widget>[
            SizedBox(
             width: 328,
             height: 328,
             child: Image(image: AssetImage('images/logo.png'),) 
            ),
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
            ),
          Container(
            height: 40,
            alignment: Alignment.centerRight,
            child: FlatButton (
            child: Text("Recuperar Senha",
            textAlign: TextAlign.right,
            ),
           onPressed: () {
             Navigator.push(
               context, MaterialPageRoute( //rota para outra página
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
                stops: [0.3,1],
                colors: [
                  Color.fromRGBO(0,0,255,100),
                  Color.fromRGBO(0,0,139,100),
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
                  onPressed: () {}
                  ),
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
                stops: [0.3,1],
                colors: [
                  Color.fromRGBO(0,0,255,100),
                  Color.fromRGBO(0,0,139,100),
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
                  onPressed: () {}
                  ),
              ),
          ),

          ],

        ), //o listView serve para fixar as coisas na página(teclado sobresair)
        ),
    );
  }
}