import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(TelaDeLogin());

class TelaDeLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.purple, // Changing the primary color to a more vibrant color
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Center(
          child: FormDeLogin(),
        ),
      ),
    );
  }
}

class FormDeLogin extends StatefulWidget {
  @override
  _FormDeLoginState createState() => _FormDeLoginState();
}

class _FormDeLoginState extends State<FormDeLogin> {
  final _formKey = GlobalKey<FormState>();
  String? _login;
  String? _senha;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.lock, size: 100.0),
          SizedBox(height: 20.0),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Login',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Por favor, insira seu login';
              }
              return null;
            },
            onSaved: (value) {
              _login = value;
            },
          ),
          SizedBox(height: 20.0),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Senha',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Por favor, insira sua senha';
              }
              return null;
            },
            onSaved: (value) {
              _senha = value;
            },
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                _formKey.currentState?.save();
                login();
              }
            },
            child: Text('Entrar'),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                _formKey.currentState?.save();
                cadastrar();
              }
            },
            child: Text('Fazer Cadastro'),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                _formKey.currentState?.save();
                esqueciSenha();
              }
            },
            child: Text('Esqueci minha senha'),
          ),
        ],
      ),
    );
  }

  void login() {
    // Implemente a lógica de login aqui
    print('Logado com login: $_login, senha: $_senha');
  }

  void cadastrar() {
    // Implemente a lógica de cadastro aqui
    print('Cadastro realizado com login: $_login, senha: $_senha');
  }

  void esqueciSenha() {
    // Gerar número aleatório entre 0 e 9999
    Random random = Random();
    int codigo = random.nextInt(10000);

    // Enviar código para o e-mail do usuário
    enviarEmail(codigo);

    // Exibir mensagem para o usuário
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Esqueci minha senha'),
          content: Text('Um código de validação foi enviado para o seu e-mail.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void enviarEmail(int codigo) {
    // Implemente o envio de e-mail aqui
    print('Código de validação: $codigo');
  }
}