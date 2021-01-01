import 'dart:convert';
import 'package:gkblab/models/postModels.dart';
import 'package:http/http.dart' as http;

int dataLength;
getPost() async {
  String url = "https://5fdf8332eca1780017a30d3f.mockapi.io/api/v1/posts";
  var responce = await http.get(url);
  var result = json.decode(responce.body);
  // List<PostModels> myPostLisyt;
  var myPostList = List<PostModels>();
  for (var item in result) {
    var postData = PostModels.fromJson(item);
    myPostList.add(postData);
  }
  dataLength = myPostList.length;
  return myPostList;
}
