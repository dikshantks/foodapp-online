// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmp_online/classes/backend/product_bloc/bloc/prodcut_bloc.dart';
import 'package:tmp_online/classes/menu_items/menu_item_model.dart';
import 'package:tmp_online/screens/favorite_screen.dart';
import 'package:tmp_online/tests/menu_test.dart';
import '../components/menu_card.dart';
import '../components/constants.dart';

class HomeScreenWithMenu extends StatefulWidget {
  const HomeScreenWithMenu({Key? key}) : super(key: key);

  @override
  State<HomeScreenWithMenu> createState() => _HomeScreenWithMenuState();
}

class _HomeScreenWithMenuState extends State<HomeScreenWithMenu> {
  int currentIndex = 0;

  List<Products> favorite = [];

  List<Widget> scafflod = [
    MenuScreen(fav: [], sample1: []),
    FavouriteItemScreen(favorite_item: []),
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
      endDrawer: Drawer(
        child: ListView(padding: EdgeInsets.zero, children: <Widget>[
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
            title: Text('Sign Out'),
            onTap: () {
              Navigator.popAndPushNamed(context, '/');
            },
          )
        ]),
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
              "Online",
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

  late List<Products> fav;

  final List<Products> sample1;

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  void onpress() {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<ProdcutBloc, ProdcutState>(
        builder: (context, state) {
          if (state is ProdcutLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ProdcutLoaded) {
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) => MenuCard(
                onpress: onpress,
                currentItem: state.products[index]!,
              ),
            );
          } else {
            return Center(
              child: Text("Something went wrong "),
            );
          }
        },
      ),
    );
  }
}
