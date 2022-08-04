import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../components/menu_card.dart';
import '../tests/menu_test.dart';

class FavouriteItemScreen extends StatefulWidget {
  FavouriteItemScreen({Key? key, required this.favorite_item})
      : super(key: key);

  final List<MenuItems> favorite_item;

  @override
  State<FavouriteItemScreen> createState() =>
      _FavouriteItemScreenState(favorite_item);
}

class _FavouriteItemScreenState extends State<FavouriteItemScreen> {
  final List<MenuItems> favorite_item;

  _FavouriteItemScreenState(this.favorite_item);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        itemCount: favorite_item.length,
        itemBuilder: (context, index) => MenuCard(
          onpress: () {},
          currentItem: favorite_item[index],
        ),
      ),
    );
  }
}
