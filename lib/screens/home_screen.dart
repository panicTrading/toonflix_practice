import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Future<List<WebtoonModel>> webtoonModels = ApiService().getTodayToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 5,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Today`s 툰',
              style: TextStyle(
                color: Color.fromARGB(255, 222, 245, 234),
                fontSize: 27,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),
      ),
      body: FutureBuilder(
        future: webtoonModels,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              padding: const EdgeInsets.symmetric(
                vertical: 60,
                horizontal: 75,
              ),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                var webToonData = snapshot.data![index];
                return Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 60,
                      ),
                      Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        width: 250,
                        child: Image.network(webToonData.thumb),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        child: Text(
                          webToonData.title,
                          style: const TextStyle(
                            fontFamily: 'SingleDay-Regular',
                            fontSize: 30,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                width: 25,
              ),
              itemCount: snapshot.data!.length,
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
