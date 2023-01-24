import 'dart:convert';

import 'package:http/http.dart' as http;

class WebtoonDetailModel {
  final apiUrl = 'webtoon-crawler.nomadcoders.workers.dev';
  late final String id;
  String about = '', genre = '', age = '';

  WebtoonDetailModel({required this.id});

  Future<WebtoonDetailModel> createInfo() async {
    dynamic returnValue = WebtoonDetailModel(id: id);
    Uri url = Uri.https(apiUrl, id);
    var getData = await http.get(url);
    dynamic model = jsonDecode(getData.body);
    returnValue.about = model['about'];
    returnValue.genre = model['genre'];
    returnValue.age = model['age'];

    return returnValue;
  }
}
