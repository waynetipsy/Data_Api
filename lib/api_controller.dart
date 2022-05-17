import 'package:api_json/dart_json_class.dart';
import 'package:http/http.dart' as http;


class ApiProvider {
  Future<List<Users>> getUsers() async {
    const url = 'https://jsonplaceholder.typicode.com/users';
   
    final req = await http.get(Uri.parse(url));

    if(req.statusCode == 200) {
      final body = req.body;

      final users = usersFromJson(body);

      print(users);

      return users;
    }else{
      final body = req.body;
      final error = usersFromJson(body);
      print(error);
      return error;
    }
  }
} 