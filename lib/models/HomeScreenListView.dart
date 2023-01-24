import 'package:flutter/material.dart';
import 'package:toonflix/screens/detail_screen.dart';

class HomeScreenListView extends StatelessWidget {
  const HomeScreenListView({
    Key? key,
    required this.models,
  }) : super(key: key);

  final Future<dynamic> models;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: models,
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
                    const SizedBox(
                      height: 60,
                    ),
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      width: 250,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                model: webToonData,
                              ),
                            ),
                          );
                        },
                        child: Image.network(webToonData.thumb),
                      ),
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
    );
  }
}
