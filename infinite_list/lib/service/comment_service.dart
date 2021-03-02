import 'dart:convert';
import 'package:infinite_list/models/Comment.dart';
import 'package:http/http.dart' as http;

Future<List<Comment>> getComments(int start, int limit) async {
  List<Comment> res = List();
  final http.Client httpClient = http.Client();
  String url = "https://jsonplaceholder.typicode.com/comments?_start=$start&_limit=$limit";
  try {
    final response = await httpClient.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      res = data.map((comment) {
        return Comment(
            id: comment['id'],
            name: comment['name'],
            body: comment['body'],
            email: comment['email']);
      }).toList();
    }
  } catch (exception) {
    print(exception.toString());
  }
  return res;
}
