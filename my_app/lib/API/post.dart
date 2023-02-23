import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> postAPI() async {
  final response = await http.post(
    Uri.parse('https://auth.etna-alternance.net/identity'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'username': 'deroui_y',
      'password': ''
    }),
  );

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    print(jsonData);
  } else {
    throw Exception('Échec de la requête API');
  }
}