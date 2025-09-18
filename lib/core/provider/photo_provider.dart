import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:api_call_with_provider/data/models/photo_model.dart';
import 'package:http/http.dart' as http;

class PhotoProvider extends ChangeNotifier {
  List<PhotoModel> photoResponse = [];

  PhotoProvider() {
    getPhotoData();
  }

  Future<void> getPhotoData() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/photos'),
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      photoResponse = responseData
          .map((data) => PhotoModel.fromJson(data))
          .toList();
      print(photoResponse);
      notifyListeners();
    } else {
      throw Exception("somthing went wrong");
      notifyListeners();
    }
  }
}
