
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:portal/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<Album>? _futureAlbum;

  // bool hidePassword = true;
  // bool isApiCallProcess = false;
  // GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  // late LoginRequestModel loginRequestModel;
  // final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portal',
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: buildColumn(),
          // child: (_futureAlbum == null) ? buildColumn() : buildFutureBuilder(),
        ),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Portal",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 35),
        ),
        SizedBox(
          height: 20,
        ),
        TextField(
          controller: _emailController,
          keyboardType: TextInputType.text,
          autofocus: false,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.email),
            filled: true,
            fillColor: Color(0xFFF2F3F5),
            hintStyle: TextStyle(
              color: Color(0xFF666666),
            ),
            hintText: 'Email',
          ),
        ),
        SizedBox(
          height: 20,
        ),
        TextField(
          controller: _passwordController,
          keyboardType: TextInputType.visiblePassword,
          autofocus: false,
          obscureText: true,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock),
            filled: true,
            fillColor: Color(0xFFF2F3F5),
            hintStyle: TextStyle(
              color: Color(0xFF666666),
            ),
            hintText: 'Password',
          ),
        ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _futureAlbum = createAlbum(_emailController.text, _passwordController.text);
            });
          },
          child: const Text('Login'),
        ),
      ],
    );
  }

  Future<Album> createAlbum(String employee_custom_id, String password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final response = await http.post(
      Uri.parse('https://portal-api.jomakhata.com/api/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'employee_custom_id': employee_custom_id,
        'password': password,
      }),
    );
    final data = json.decode(response.body);
    if (response.statusCode == 200) {

      sharedPreferences.setString("token", data['token']);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => Main()),
          (Route<dynamic> route) => false);

      log('$data');
      return Album.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create album.');
    }
  }
}

class Album {
  final int id;
  final String employee_custom_id;
  final String password;

  Album(
      {required this.id,
      required this.employee_custom_id,
      required this.password});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      employee_custom_id: json['title'],
      password: json['password'],
    );
  }
}
