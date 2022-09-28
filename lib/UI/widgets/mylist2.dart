import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix/data/models.dart';

class Previews extends StatelessWidget {
  final String title;
  final List<Serie> contentList;

  const Previews({
    Key? key,
    required this.title,
    required this.contentList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 270.0,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 16.0,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: contentList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Serie content = contentList[index];
                      return GestureDetector(
                        onTap: () => print(content.name),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  height: 200.0,
                                  width: 130.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10)),
                                    image: DecorationImage(
                                      image: AssetImage(content.imageUrl),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                    top: 70,
                                    left: 40,
                                    child: Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:
                                                Colors.black.withOpacity(0.7)),
                                        child: Icon(
                                          Icons.play_arrow,
                                          color: Colors.white,
                                          size: 60,
                                        ))),
                              ],
                            ),
                            Stack(
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  color: Colors.grey,
                                  width: 130,
                                  height: 3,
                                ),
                                Container(
                                  height: 3,
                                  width: Random().nextInt(125).toDouble(),
                                  color: Colors.red,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                ),
                              ],
                            ),
                            Container(
                              height: 40,
                              width: 130,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                                                                  color: Color(0xFF191919),

                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    Icons.info_outline,
                                    color: Colors.white,
                                  ),
                                  Icon(
                                    Icons.more_vert,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
