import 'package:flutter/material.dart';

import 'HomePage.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _username = "";
  String? _nickname;
  String _password = "";
  bool isClicked = false;
  bool _obscurePassword = true; // Variabel untuk mengontrol visibilitas password

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 2));

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(
          username: _username,
          nickname: _nickname,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Halaman Login"),
        ),
        body: Column(
          children: [
            _logoImage(),
            _usernameField(),
            _nicknameField(),
            _passwordField(), 
            _loginButton(context),
          ],
        ),
      ),
    );
  }

  Widget _logoImage() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Image.asset(
        'assets/upnLogo.png',
        height: 60,
        width: 60,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _nicknameField() {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: TextFormField(
          enabled: true,
          onChanged: (value) {
            _nickname = value;
          },
          decoration: InputDecoration(
            hintText: 'Nama Lengkap',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(
                width: 90000,
                color: const Color.fromARGB(255, 219, 219, 219),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _usernameField() {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: TextFormField(
          enabled: true,
          onChanged: (value) {
            _username = value;
          },
          decoration: InputDecoration(
            hintText: 'Username',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(
                width: 90000,
                color: const Color.fromARGB(255, 221, 221, 221),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: TextFormField(
          enabled: true,
          obscureText: _obscurePassword, // Menggunakan variabel untuk visibilitas
          onChanged: (value) {
            _password = value;
          },
          decoration: InputDecoration(
            hintText: 'Password',
            hintStyle: TextStyle(color: Colors.black26),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(
                width: 90000,
                color: const Color.fromARGB(255, 200, 200, 200),
              ),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _obscurePassword ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword; // visibilitas password
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: isClicked == true
              ? MaterialStateProperty.all(const Color.fromARGB(255, 0, 145, 60))
              : MaterialStateProperty.all(const Color.fromARGB(255, 255, 186, 194)),
        ),
        onPressed: () {
          if (_username == "124220088" && _password == "333") {
            _navigateToHome();

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Login Berhasil!'),
              ),
            );

            setState(() {
              isClicked = !isClicked;
              print(isClicked);
            });
          }
        },
        child: const Text('Login'),
      ),
    );
  }
}
