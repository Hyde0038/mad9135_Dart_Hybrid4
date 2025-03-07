import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void main() async {
  var uri = Uri.parse('https://random-data-api.com/api/v2/users?size=12');
  try {
    final resp = await http.get(uri);
    if (resp.statusCode == 200) {
      var jsonResp = convert.jsonDecode(resp.body) as List<dynamic>;
      print('User data: $jsonResp');
    }
  } catch (err) {
    print('Failed http request $uri');
  }
}
