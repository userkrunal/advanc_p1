import 'dart:convert';

import 'package:advanc_p1/quz_app/model/quz_model.dart';
import 'package:http/http.dart' as http;

class QuezApiCalling
{

  static QuezApiCalling quezApiCalling=QuezApiCalling();
  Future<QuezModel> quezApi()
  async {
    String? link="https://opentdb.com/api.php?amount=10&category=27&difficulty=medium&type=multiple";
    var responce=await http.get(Uri.parse(link));
    var json=jsonDecode(responce.body);
    QuezModel quezModel;
    quezModel=QuezModel.fromJson(json);
    return quezModel;
  }
}