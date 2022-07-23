import 'dart:convert';

import 'package:infinite_list/models/comment.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';

@Deprecated("Khong dung ham nay nua")
Future<List<Comment>> getListComment(int start, int limit) async {
  final url =
      "https://jsonplaceholder.typicode.com/comments?_start=$start&_limit=$limit";
  final http.Client httpClient = http.Client();
  List<Comment> data = [];
  try {
    final response = await httpClient.get(Uri.parse(url));
    print(response);
    if (response.statusCode == 200) {
      var responseData = json.decode(response.body) as List;
      print(responseData);
      data = responseData
          .map((data) => Comment(
              id: data['id'],
              name: data['name'],
              body: data['body'],
              email: data['email']))
          .toList();
    }
  } catch (e) {
    print(e.toString());
    data = List.empty();
  }
  return data;
}
