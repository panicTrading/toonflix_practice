import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon_model.dart';

class ApiService {
  final apiUrl = 'webtoon-crawler.nomadcoders.workers.dev';
  final option = 'today';

  ApiService();

  Future<List<WebtoonModel>> getTodayToons() async {
    List<WebtoonModel> webtoonList = [];
    final url = Uri.https(apiUrl, option);
    final getData = await http.get(url);
    final List<dynamic> getJson = jsonDecode(getData.body);
    for (var json in getJson) {
      webtoonList.add(
        WebtoonModel.createmodel(
          title: json['title'],
          thumb: json['thumb'],
          id: json['id'],
        ),
      );
    }
    return webtoonList;
  }
}
