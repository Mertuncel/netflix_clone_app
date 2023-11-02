import 'package:flutter/material.dart';
import 'package:netflix_app/components/pages_title.dart';
import 'package:netflix_app/components/profile_and_icon.dart';

class DownloadPage extends StatefulWidget {
  const DownloadPage({super.key});

  @override
  State<DownloadPage> createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(),
        actions: const [ProfileAndIcon()],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          smartDownloads(),
          const SizedBox(
            height: 60,
          ),
          Column(
            children: [
              downloadImage(),
              const SizedBox(
                height: 30,
              ),
              text1(),
              const SizedBox(
                height: 30,
              ),
              text2(),
              const SizedBox(
                height: 40,
              ),
              const SizedBox(
                height: 50,
              ),
              downloadButton(),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget downloadButton() {
    return SizedBox(
      height: 40,
      child: ElevatedButton(
        onPressed: () {},
        style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(Colors.white)),
        child: const Text(
          "See What You Can Download",
          style: TextStyle(
              color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget text2() {
    return const Padding(
      padding: EdgeInsets.only(left: 50, right: 50),
      child: Text(
        "Download shows and movies so you'lln \nnever be without something to watch even when you're offline",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 16,
            height: 1.5,
            fontWeight: FontWeight.bold,
            color: Colors.white),
      ),
    );
  }

  Widget text1() {
    return const Text(
      'Never be without Netflix',
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }

  Widget downloadImage() {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey.withOpacity(0.2),
      ),
      child: Center(
        child: Icon(
          Icons.file_download,
          size: 80,
          color: Colors.grey.withOpacity(0.2),
        ),
      ),
    );
  }

  Widget smartDownloads() {
    return Container(
      height: 50,
      decoration: BoxDecoration(color: Colors.grey.withOpacity(0.2)),
      child: const Padding(
        padding: EdgeInsets.only(left: 20),
        child: Row(
          children: [
            Icon(Icons.info_outline),
            SizedBox(
              width: 10,
            ),
            Text(
              'Smart Downloads',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 6,
            ),
            Text(
              'ON',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget appBar() {
    return const Row(
      children: [
        PagesTitle(title: 'My Downloads'),
      ],
    );
  }
}
