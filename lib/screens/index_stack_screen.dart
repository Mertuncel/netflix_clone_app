import 'package:flutter/material.dart';
import 'package:netflix_app/screens/pages/coming_soon_page.dart';
import 'package:netflix_app/screens/pages/download_page.dart';
import 'package:netflix_app/screens/pages/search_page.dart';

import 'pages/home_page.dart';

class IndexStackScreen extends StatelessWidget {
  const IndexStackScreen({
    super.key,
    required this.activeTab,
  });

  final int activeTab;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: activeTab,
      children: const [
        HomePage(),
        ComingSoonPage(),
        SearchPage(),
        DownloadPage(),
      ],
    );
  }
}
