import 'package:flutter/material.dart';

import 'package:netflix_app/components/logoIcons.dart';
import 'package:netflix_app/components/profile_and_icon.dart';
import 'package:netflix_app/json/home_json.dart';
import 'package:netflix_app/screens/pages/video_detail_pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  MovieImages(
                    size: size,
                    image: const AssetImage('assets/images/banner.webp'),
                    textImage: 'assets/images/title_img.webp',
                    text: 'Excting - Sci-Fi Drama - Sci-Fi Adventure',
                  ),
                  SafeArea(
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              LogoIcons(),
                              ProfileAndIcon(),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        categories(),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              myListPlayandInfo(),
              const SizedBox(
                height: 40,
              ),
              listText('My List'),
              const SizedBox(height: 8),
              const MoviesList(),
              const SizedBox(
                height: 15,
              ),
              listText('Popular on Netflix'),
              const SizedBox(
                height: 10,
              ),
              netflixPopularList(),
              const SizedBox(
                height: 10,
              ),
              listText('Trending Now'),
              const SizedBox(
                height: 10,
              ),
              const TrendingNowList()
            ],
          ),
        ),
      ),
    );
  }

  Widget netflixPopularList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          children: List.generate(popularList.length, (index) {
            return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const VideoDetailPage(
                            videoUrl: 'assets/videos/video_2.mp4',
                          )));
            },
              child: Container(
                width: 110,
                height: 160,
                margin: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(popularList[index]['img'])),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget listText(String text) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            text,
            style: const TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }

  Widget myListPlayandInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            iconButton(icon: Icons.add, press: () {}, size: 30),
            const Text(
              'My List',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ],
        ),
        SizedBox(
          height: 40,
          child: ElevatedButton(
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.white)),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const VideoDetailPage(
                            videoUrl: 'assets/videos/video_1.mp4',
                          )));
            },
            child: const Row(
              children: [
                Icon(
                  Icons.play_arrow,
                  color: Colors.black,
                  size: 30,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Play',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        Column(
          children: [
            iconButton(icon: Icons.info_outline, press: () {}, size: 30),
            const Text(
              'Info',
              style: TextStyle(color: Colors.white, fontSize: 18),
            )
          ],
        ),
      ],
    );
  }

  Widget categories() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          categoriesText(category: 'Tv Shows'),
          categoriesText(category: 'Movies'),
          Row(
            children: [
              categoriesText(category: 'Categories'),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget categoriesText({required String category}) {
    return Text(
      category,
      style: const TextStyle(
          fontSize: 15,
          color: Color.fromARGB(255, 230, 225, 225),
          fontWeight: FontWeight.bold),
    );
  }

  IconButton iconButton({
    Function()? press,
    IconData? icon,
    double? size,
  }) {
    return IconButton(
      onPressed: press,
      icon: Icon(icon),
      iconSize: size,
    );
  }
}

class TrendingNowList extends StatelessWidget {
  const TrendingNowList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          children: List.generate(trendingList.length, (index) {
            return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const VideoDetailPage(
                            videoUrl: 'assets/videos/video_2.mp4',
                          )));
            },
              child: Container(
                width: 110,
                height: 160,
                margin: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(trendingList[index]['img'])),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class MoviesList extends StatelessWidget {
  const MoviesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          children: List.generate(mylist.length, (index) {
            return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const VideoDetailPage(
                            videoUrl: 'assets/videos/video_1.mp4',
                          )));
            },
              child: Container(
                width: 110,
                height: 160,
                margin: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(mylist[index]['img'])),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class MovieImages extends StatelessWidget {
  const MovieImages({
    super.key,
    required this.size,
    required this.textImage,
    required this.image,
    required this.text,
  });

  final Size size;
  final String textImage;
  final AssetImage image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 500,
                decoration: BoxDecoration(
                    image: DecorationImage(image: image, fit: BoxFit.cover)),
              ),
              Container(
                height: 500,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.85),
                      Colors.black.withOpacity(0),
                    ],
                    end: Alignment.topCenter,
                    begin: Alignment.bottomCenter,
                  ),
                ),
              ),
              Positioned(
                left: 60,
                bottom: 0,
                child: Column(
                  children: [
                    Image.asset(
                      textImage,
                      width: 300,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      text,
                      style: const TextStyle(fontSize: 13, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
