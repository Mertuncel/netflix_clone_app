import 'package:flutter/material.dart';
import 'package:netflix_app/json/root_app_json.dart';

import 'index_stack_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int activeTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigatorBar(),
      body: IndexStackScreen(activeTab: activeTab),
    );
  }

  Widget bottomNavigatorBar() {
    return SizedBox(
        height: 80,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(items.length, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    activeTab = index;
                  });
                },
                child: Column(
                  children: [
                    Icon(
                      items[index]['icon'],
                      color: Colors.white,
                      size: 30,
                    ),
                   const SizedBox(
                      height: 10,
                    ),
                    Text(
                      items[index]['text'],
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                    )
                  ],
                ),
              );
            }),
          ),
        ));
  }
}
