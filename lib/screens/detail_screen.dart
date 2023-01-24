import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_detail_model.dart';
import 'package:toonflix/models/webtoon_model.dart';

class DetailScreen extends StatelessWidget {
  late WebtoonModel model;
  late WebtoonDetailModel webDeModel = WebtoonDetailModel(id: model.id);

  DetailScreen({required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 5,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              model.title,
              style: const TextStyle(
                color: Color.fromARGB(255, 222, 245, 234),
                fontSize: 20,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),
      ),
      body: FutureBuilder(
        future: webDeModel.createInfo(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            webDeModel.about = snapshot.data!.about;
            webDeModel.genre = snapshot.data!.genre;
            webDeModel.age = snapshot.data!.age;
            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.center,
                  clipBehavior: Clip.hardEdge,
                  height: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.network(model.thumb),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 300,
                  child: const Text(
                    '내용 : ',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  child: Text(
                    webDeModel.about,
                    style: const TextStyle(
                      fontFamily: 'HiMelody-Regular',
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
