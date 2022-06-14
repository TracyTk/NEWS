import 'package:flutter/material.dart';
import 'home_page.dart';
import 'inbox_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> _pages = [
    const HomePage(),
    const InboxPage(),
  ];
  int _selectedIndex = 0;

  void _onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter UI Widgets'),
      ),

      // body: GridView.count(
      //   crossAxisCount: 2,
      //   // childAspectRatio: 0.95,
      //   children: [
      //     ArticleCard(article: articles[0]),
      //     ArticleCard(article: articles[1]),
      //     ArticleCard(article: articles[2]),
      //   ],
      // ),

      // body: ListView(
      //   children: [
      //     ArticleCard(article: articles[0]),
      //     ArticleCard(article: articles[1]),
      //     ArticleCard(article: articles[2]),
      //   ],
      // ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [..._pages],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTapped,
        items: [
          const BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          const BottomNavigationBarItem(
            label: 'Inbox',
            icon: Icon(Icons.mail),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Clicked');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
