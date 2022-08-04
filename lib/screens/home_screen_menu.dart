// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tmp_online/screens/favorite_screen.dart';
import 'package:tmp_online/tests/menu_test.dart';
import '../components/menu_card.dart';
import '../constants.dart';

class HomeScreenWithMenu extends StatefulWidget {
  const HomeScreenWithMenu({Key? key}) : super(key: key);

  @override
  State<HomeScreenWithMenu> createState() => _HomeScreenWithMenuState();
}

class _HomeScreenWithMenuState extends State<HomeScreenWithMenu> {
  int currentIndex = 0;

  List<MenuItems> favorite = [sample[3]];

  List<Widget> scafflod = [
    MenuScreen(fav: [], sample1: sample),
    FavouriteItemScreen(favorite_item: [sample[2], sample[1]]),
    Container(
      color: whiteColor,
      child: Center(
        child: Text('my nam '),
      ),
    ),
    Center(
      child: Text('my name is '),
    ),
  ];

  void _onItemTapped(int index) {
    print(currentIndex);

    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FlutterLogo(
                    size: 80,
                  ),
                  Text('Name'),
                  Text('Email'),
                ],
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
            ListTile(
              title: Text('Cart'),
              onTap: () {
                Navigator.pushNamed(context, '/cart');
              },
            ),
            ListTile(
              title: Text('Orders'),
            ),
            ListTile(
              title: Text('Settings'),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {},
              // You can write the navigation code in this block of function,
              // So you can navigate to the other page.
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {},
              // To make the list tile clickable I added empty function block
            ),
          ],
        ),
      ),
      appBar: AppBar(
        actions: [
          Builder(builder: (context) {
            return GestureDetector(
              onTap: () => Scaffold.of(context).openEndDrawer(),
              child: const CircleAvatar(
                child: Icon(
                  Icons.person,
                ),
              ),
            );
          }),
          SizedBox(
            width: 20.0,
          )
        ],
        elevation: 1.0,
        backgroundColor: const Color(0xFF101015),
        title: Row(
          children: const <Widget>[
            SizedBox(
              width: 20.0,
            ),
            Text('foodme'),
            Text(
              "Onine",
              style: TextStyle(
                color: purpleColor,
              ),
            )
          ],
        ),
      ),
      body: scafflod[currentIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(top: defaultPadding / 2),
        color: const Color(0xFF101015),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: _onItemTapped,
          backgroundColor: const Color(0xFF101015),
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12,
          selectedItemColor: whiteColor,
          unselectedItemColor: purpleColor,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_sharp),
              label: "Menu",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_outlined),
              label: "favourite",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.timelapse),
              label: "orders History",
            ),
          ],
        ),
      ),
    );
  }
}

class MenuScreen extends StatefulWidget {
  MenuScreen({
    Key? key,
    required this.sample1,
    required this.fav,
  }) : super(key: key);

  late List<MenuItems> fav;

  final List<MenuItems> sample1;

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  void onpress() {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        itemCount: widget.sample1.length,
        itemBuilder: (context, index) => MenuCard(
          onpress: onpress,
          currentItem: widget.sample1[index],
        ),
      ),
    );
  }
}
