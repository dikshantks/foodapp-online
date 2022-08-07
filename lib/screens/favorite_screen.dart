import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tmp_online/classes/backend/favitem/bloc/fav_bloc.dart';
import 'package:tmp_online/components/favitem_card.dart';

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
      child: BlocBuilder<FavBloc, FavState>(
        builder: (context, state) {
          if (state is FavListLoaded) {
            return ListView.builder(
              itemCount: state.favItemModal.Favitems.length,
              itemBuilder: (context, index) => FavCard(
                // iswishlist: true,
                onpress: () {},
                currentItem: state.favItemModal.Favitems[index],
              ),
            );
          } else if (state is FavListLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Text('something is wrong');
          }
        },
      ),
    );
  }
}
