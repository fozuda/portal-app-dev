import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Future<Album> createAlbum(String limit, String orderBy, String orderType ) async {
//   var token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjI4OTksImlzcyI6Imh0dHBzOi8vcG9ydGFsLWFwaS5qb21ha2hhdGEuY29tL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNjI4NjE0MDcyLCJleHAiOjE2Mjg3MDA0NzIsIm5iZiI6MTYyODYxNDA3MiwianRpIjoiRnRjaGllbTFFdVlsYXZidyJ9.O24U0XGFiZdfXRGUP5xYD82-LisSbMsCtVZnuG6iTiY";
//   final response = await http.post(
//     Uri.parse('https://portal-api.jomakhata.com/api/getOrganizationData'),
//     headers: <String, String>{
//       '':'application/json',
//       'Authorization': 'Bearer $token',
//     },
//     body: json.encode({
//       'limit': 1,
//       'orderBy': "idEmployee",
//       'orderType': "DESC",
//     }),
//   );
//   print(response.statusCode);
//   final data = json.decode(response.body);
//   print(data);
//   // print(response.body);
//   // if (response.statusCode == 200) {
//     // If the server did return a 201 CREATED response,
//     // then parse the JSON.
//
//     // print(data);
//     // log('$data');
//     return Album.fromJson(json.decode(response.body));
//   // } else {
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     throw Exception('Failed to create album.');
//   // }
// }

getData() async {
  String url = 'https://portal-api.jomakhata.com/api/getOrganizationData';
  String token = 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjI4OTksImlzcyI6Imh0dHBzOi8vcG9ydGFsLWFwaS5qb21ha2hhdGEuY29tL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNjI4NjE0MDcyLCJleHAiOjE2Mjg3MDA0NzIsIm5iZiI6MTYyODYxNDA3MiwianRpIjoiRnRjaGllbTFFdVlsYXZidyJ9.O24U0XGFiZdfXRGUP5xYD82-LisSbMsCtVZnuG6iTiY';
  Dio dio = new Dio();
  dio.options.headers['content-Type'] = 'application/json';
  dio.options.headers["authorization"] = "${token}";
  final body = {
    'limit': 1,
    'orderBy': 'idEmployee',
    'orderType': 'DESC'
  };

  final response = await dio.post(url, data: body);
  print(response.statusCode);
  print(response.data);
}


class Album {
  // final int id;
  final int limit;
  final String orderBy;
  final String orderType;

  Album({
    // required this.id,
    required this.limit,
    required this.orderBy,
    required this.orderType,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      // id: json['id'],
      limit: json['limit'] as int,
      orderBy: json['orderBy'] as String,
      orderType: json['orderType'] as String,
    );
  }
}


class Lists extends StatefulWidget {
  const Lists({Key? key}) : super(key: key);

  @override
  _ListsState createState() {
    return _ListsState();
  }
}

class _ListsState extends State<Lists> {
  final TextEditingController _limitController = TextEditingController();
  final TextEditingController _orderByController = TextEditingController();
  final TextEditingController _orderTypeController = TextEditingController();
  Future<Album>? _futureAlbum;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          // child: (_futureAlbum == null) ? buildColumn() : buildFutureBuilder(),
        ),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // TextField(
        //   controller: _limitController,
        //   decoration: const InputDecoration(hintText: 'Enter Limit'),
        // ),
        // TextField(
        //   controller: _orderByController,
        //   decoration: const InputDecoration(hintText: 'Enter orderBy'),
        // ),
        // TextField(
        //   controller: _orderTypeController,
        //   decoration: const InputDecoration(hintText: 'Enter orderType'),
        // ),
        Container(
          // onPressed: () {
          //   setState(() {
          //     _futureAlbum = createAlbum(_limitController.text, _orderByController.text, _orderTypeController.text);
          //   });
          // },
          // child: const Text('List'),
        ),
      ],
    );
  }

  // FutureBuilder<Album> buildFutureBuilder() {
  //   return FutureBuilder<Album>(
  //     future: _futureAlbum,
  //     builder: (context, snapshot) {
  //       if (snapshot.hasData) {
  //         // return Text(snapshot.data!.limit);
  //       } else if (snapshot.hasError) {
  //         return Text('${snapshot.error}');
  //       }
  //
  //       return const CircularProgressIndicator();
  //     },
  //   );
  // }
}
