import 'package:flutter/material.dart';
import 'package:my_app/routes/movie_list_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class NavigationBarData {
  final IconData icon;
  final String text;
  const NavigationBarData(this.text, this.icon);
}

//Home | Movies | TV Shows
class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  void onSelectTab(int index) {
    if (index == _currentIndex) return;
    setState(() {
      _currentIndex = index;
    });
  }

  static const List<Widget> screenDataList = [
    MovieList(),
    Text("Movies"),
    Text("TV Shows"),
  ];

  static const List<NavigationBarData> navBarDataList = [
    NavigationBarData("Home", Icons.home),
    NavigationBarData("Movies", Icons.movie_outlined),
    NavigationBarData("TV Shows", Icons.tv)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
          color: Colors.white,
        ),
        title: const Text(
          "TMDB",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.account_circle_outlined),
            color: Colors.white,
            iconSize: 30,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            iconSize: 30,
            color: Colors.white,
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onSelectTab,
        selectedFontSize: 12,
        currentIndex: _currentIndex,
        items: navBarDataList
            .map((data) => BottomNavigationBarItem(
                icon: Icon(data.icon), label: data.text))
            .toList(),
      ),
      body: Container(
        child: screenDataList[_currentIndex],
      ),
    );
  }
}
