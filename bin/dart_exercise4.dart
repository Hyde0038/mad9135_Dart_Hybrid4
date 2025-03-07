import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:dart_exercise4/user.dart';

void main() async {
  var uri = Uri.parse('https://random-data-api.com/api/v2/users?size=12');
  try {
    final resp = await http.get(uri);
    if (resp.statusCode == 200) {
      var jsonResp = convert.jsonDecode(resp.body) as List<dynamic>;
      List<User> users = jsonResp.map((user) => User.fromJson(user)).toList();
      users.sort((a, b) => a.firstName.compareTo(b.firstName));

      for (var user in users) {
        user.userOutput();
      }
    } else {
      print('Failed to load users: ${resp.statusCode}');
    }
  } catch (err) {
    print('Failed http request: $err');
  }
}
