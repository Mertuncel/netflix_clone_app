import 'package:flutter/material.dart';
import 'package:netflix_app/json/search_json.dart';

import 'video_detail_pages.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: searchBar(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, top: 10, right: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              searchesTitle(),
              const SizedBox(
                height: 12,
              ),
              moviesAndPlayIcons(size),
            ],
          ),
        ),
      ),
    );
  }

  Widget moviesAndPlayIcons(Size size) {
    return Column(
              children: List.generate(searchJson.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      GestureDetector(
                      onTap: () {
                        Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) =>  const VideoDetailPage(
                            videoUrl: 'assets/videos/video_1.mp4',
                          )));
                      },
                        child: SizedBox(
                          width: (size.width - 36) * 0.8,
                          height: 80,
                          child: Row(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    width: 120,
                                    height: 70,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.red,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                searchJson[index]['img']),
                                            fit: BoxFit.cover)),
                                  ),
                                  Container(
                                    width: 120,
                                    height: 70,
                                    decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.2)),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              SizedBox(
                                width: (size.width - 36) * 0.4,
                                child: Text(
                                  searchJson[index]['title'],
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: (size.width - 36) * 0.2,
                        height: 80,
                        child: Center(
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(width: 2, color: Colors.white),
                            ),
                            child: const Center(
                              child: Icon(Icons.play_arrow),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            );
  }

  Widget searchesTitle() {
    return const Text(
      'Top Searches',
      style: TextStyle(
          color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Widget searchBar() {
    return Container(
      height: 35,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.25),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Search',
            hintStyle: TextStyle(
              color: Colors.white.withOpacity(0.5),
            ),
            prefixIconColor: Colors.white.withOpacity(0.5),
            prefixIcon: const Icon(Icons.search_outlined)),
      ),
    );
  }
}
