import 'package:flutter/material.dart';
import 'package:netflix_app/components/text_design.dart';
import 'package:netflix_app/json/video_detail_json.dart';
import 'package:video_player/video_player.dart';

import 'package:netflix_app/components/profile_and_icon.dart';

import '../../components/button_design.dart';
import '../../components/video_details_info_section.dart';

class VideoDetailPage extends StatefulWidget {
  const VideoDetailPage({
    Key? key,
    required this.videoUrl,
  }) : super(key: key);
  final String videoUrl;
  @override
  State<VideoDetailPage> createState() => _VideoDetailPageState();
}

class _VideoDetailPageState extends State<VideoDetailPage> {
  VideoPlayerController? _controller;
  int activeMenu = 0;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(widget.videoUrl)
      ..initialize().then((value) {
        setState(() {
          _controller!.play();
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: const [ProfileAndIcon()],
      ),
      body: Column(
        children: [
          MoviePlayScreen(controller: _controller),
          Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const MovieNameText(
                      text: 'Age Of Samurai: Battle for Japan',
                    ),
                    const InfoSection(),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: TextDesign(
                        text: 'Watch Season 1 Now',
                        color: Colors.white,
                        fontsize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 20),
                      child: ButtonDesign(
                        iconColor: Colors.black,
                        text: 'Resume',
                        icon: Icons.play_arrow,
                        color: Colors.white,
                        textColor: Colors.black,
                        press: () {},
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 10),
                      child: ButtonDesign(
                          iconColor: Colors.white,
                          text: 'Download',
                          icon: Icons.download_sharp,
                          color: const Color.fromARGB(255, 60, 60, 60),
                          press: () {},
                          textColor: Colors.white),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: TextDesign(
                        text: 'S1:E1 The Rise Of Nobunaga',
                        color: Colors.white,
                        fontsize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ProcessBar(size: size),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: TextDesign(
                        text:
                            'Considered a fool and unfit to lead, Nobunaga rises\n to power as the head of the Oda clan, spurring\n dissent among those in his family vying for control.',
                        color: Colors.white.withOpacity(0.9),
                        fontsize: 16,
                        textHeight: 1.4,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 10),
                      child: TextDesign(
                        text:
                            'Cast: Masayoshi Haneda, Masami Kosaka, Hideaki İto...\n moree',
                        color: Colors.grey.withOpacity(0.9),
                        fontsize: 13,
                        textHeight: 1.4,
                      ),
                    ),
                    const OtherIcons(),
                    const SizedBox(
                      height: 20,
                    ),
                    rowMenu(),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: TextDesign(
                        text: 'Season 1',
                        color: Colors.white.withOpacity(0.5),
                        fontsize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Episodes(),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget rowMenu() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(episodesList.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(right: 25, left: 15),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  activeMenu = index;
                });
              },
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: activeMenu == index
                            ? const Border(
                                top: BorderSide(color: Colors.red, width: 4),
                              )
                            : null),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        episodesList[index],
                        style: TextStyle(
                            color: activeMenu == index
                                ? Colors.white.withOpacity(0.9)
                                : Colors.white.withOpacity(0.5),
                            fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class Episodes extends StatelessWidget {
  const Episodes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(movieList.length, (index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 150,
                      child: Stack(
                        children: [
                          Image.asset(movieList[index]['img'],
                              fit: BoxFit.cover),
                          Positioned(
                            top: 25,
                            left: 55,
                            child: Container(
                              width: 38,
                              height: 38,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black.withOpacity(0.4),
                                  border: Border.all(
                                      width: 2, color: Colors.white)),
                              child: const Icon(Icons.play_arrow),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 100,
                    child: Column(
                      children: [
                        Text(
                          movieList[index]['title'],
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 15,
                              height: 1.3,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Text(
                              movieList[index]['duration'],
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 12,
                                height: 1.3,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 55,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.file_download,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  movieList[index]['description'],
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      height: 1.4,
                      fontSize: 13),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class OtherIcons extends StatelessWidget {
  const OtherIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Row(
        children: List.generate(
            likesList.length,
            (index) => Padding(
                  padding: const EdgeInsets.only(
                    right: 40,
                    top: 15,
                  ),
                  child: Column(
                    children: [
                      Icon(
                        likesList[index]['icon'],
                        color: Colors.white.withOpacity(0.9),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        likesList[index]['text'],
                        style: TextStyle(
                            fontSize: 12, color: Colors.grey.withOpacity(0.9)),
                      )
                    ],
                  ),
                )),
      ),
    );
  }
}

class ProcessBar extends StatelessWidget {
  const ProcessBar({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                height: 2.5,
                width: (size.width - 30) * 0.75,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.withOpacity(0.5)),
              ),
              Container(
                height: 2.5,
                width: (size.width - 30) * 0.25,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color:
                        const Color.fromARGB(255, 224, 7, 7).withOpacity(0.5)),
              ),
            ],
          ),
          const SizedBox(
            width: 30,
          ),
          const TextDesign(
              text: '35 remaining', color: Colors.grey, fontsize: 11),
        ],
      ),
    );
  }
}

class MovieNameText extends StatelessWidget {
  const MovieNameText({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 35,
          height: 1.2,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class MoviePlayScreen extends StatelessWidget {
  const MoviePlayScreen({
    super.key,
    required VideoPlayerController? controller,
    this.size,
  }) : _controller = controller;

  final Size? size;
  final VideoPlayerController? _controller;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: Column(
        children: [
          Stack(
            children: [
              AspectRatio(
                  aspectRatio: _controller!.value.aspectRatio,
                  child: VideoPlayer(_controller!)),
              Positioned(
                top: 70,
                left: 170,
                child: Center(
                  child: IconButton(
                    icon: Icon(
                      _controller!.value.isPlaying ? null : Icons.play_arrow,
                      color: Colors.white,
                      size: 50,
                    ),
                    onPressed: () {
                      _controller!.value.isPlaying
                          ? _controller!.pause()
                          : _controller!.play();
                    },
                  ),
                ),
              ),
              const Positioned(
                bottom: 15,
                left: 15,
                child: Text(
                  'Preview',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 10,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.volume_mute),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
