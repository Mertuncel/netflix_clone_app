import 'package:flutter/material.dart';

import 'package:netflix_app/components/profile_and_icon.dart';
import 'package:netflix_app/json/coming_soon_json.dart';

import '../../components/pages_title.dart';

class ComingSoonPage extends StatefulWidget {
  const ComingSoonPage({super.key});

  @override
  State<ComingSoonPage> createState() => _ComingSoonPageState();
}

class _ComingSoonPageState extends State<ComingSoonPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            PagesTitle(title: 'Coming Soon'),
          ],
        ),
        actions: const [ProfileAndIcon()],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            iconsAndTitle(),
            const SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(comingSoonJson.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 220,
                        child: movieDurationAndImg(index),
                      ),
                      comingSoonJson[index]['duration']
                          ? Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      height: 2.5,
                                      decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.7),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                    Container(
                                      width: size.width * 0.34,
                                      height: 2.5,
                                      decoration: BoxDecoration(
                                          color: Colors.red.withOpacity(0.7),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                  ],
                                )
                              ],
                            )
                          : Container(),
                      const SizedBox(
                        height: 20,
                      ),
                      movieNameAndInfo(index),
                      dateTitle(index),
                      title(index),
                      descriptionTitle(index),
                      typeTitle(index),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget typeTitle(int index) {
    return Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        comingSoonJson[index]['type'],
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 14,
                        ),
                      ),
                    );
  }

  Widget descriptionTitle(int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
      child: Text(
        comingSoonJson[index]['description'],
        style: TextStyle(
            color: Colors.white.withOpacity(0.5), height: 1.6, fontSize: 15),
      ),
    );
  }

  Widget title(int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 15),
      child: Text(
        comingSoonJson[index]['title'],
        style: const TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget dateTitle(int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 20),
      child: Text(
        comingSoonJson[index]['date'],
        style: TextStyle(color: Colors.white.withOpacity(0.5)),
      ),
    );
  }

  Widget movieDurationAndImg(int index) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(comingSoonJson[index]['img']),
                fit: BoxFit.cover),
          ),
        ),
        Container(
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.2)),
        ),
      ],
    );
  }

  Widget movieNameAndInfo(int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            comingSoonJson[index]['title_img'],
            width: 120,
          ),
          Row(
            children: [
              Column(
                children: [
                  icons(icon: Icons.notifications_none_outlined),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Remind Me',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  icons(icon: Icons.info_outline),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'info',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget iconsAndTitle() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              icons(icon: Icons.notifications_none_outlined),
              const SizedBox(
                width: 15,
              ),
              const Text(
                'Notifications',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            children: [icons(icon: Icons.arrow_forward_ios)],
          ),
        ],
      ),
    );
  }

  Icon icons({IconData? icon}) {
    return Icon(icon, size: 28);
  }
}
