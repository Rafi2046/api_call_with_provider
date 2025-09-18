import 'dart:convert';
import 'dart:ffi';

import 'package:api_call_with_provider/data/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostProvider extends ChangeNotifier {
  List<PostModel> postResponse = [];

  PostProvider() {
    getPostData();
  }

  Future<void> getPostData() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      headers: {'Accept': 'application/json'},
    );
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      postResponse = responseData
          .map((data) => PostModel.fromJson(data))
          .toList();
      print(postResponse);
      notifyListeners();
      // return posts;
    } else {
      throw Exception('Something went wrong');
      // print("Something went wrong");
      notifyListeners();
      // return null;
    }
  }
}
