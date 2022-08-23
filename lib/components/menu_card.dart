// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tmp_online/classes/menu_items/menu_item_model.dart';
import '../classes/backend/favitem/bloc/fav_bloc.dart';
import 'constants.dart';
import '../tests/menu_test.dart';

class MenuCard extends StatefulWidget {
  MenuCard({
    Key? key,
    required this.currentItem,
    required this.onpress,
  }) : super(key: key);

  bool iswishlist = false;
  void onpress;

  Products currentItem;

  // MenuItems currentItem;

  @override
  State<MenuCard> createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      height: 155.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            padding: EdgeInsets.all(5.0),
            // color: Colors.blue,
            width: 150.0,
            alignment: Alignment.topLeft,
            child: Column(
              children: [
                Text(
                  widget.currentItem.name,
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  'Rs ${widget.currentItem.price}',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                BlocBuilder<FavBloc, FavState>(
                  builder: (context, state) {
                    return IconButton(
                        onPressed: () {
                          setState(() {
                            widget.iswishlist = false;
                          });
                          context.read<FavBloc>().add(
                                AddfavProduct(widget.currentItem),
                              );

                          final snackbar = SnackBar(
                              duration: Duration(milliseconds: 300),
                              content: Text('added to Favo'));

                          ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        },
                        icon: Icon(
                          widget.iswishlist
                              ? Icons.favorite
                              : Icons.favorite_outline,
                          color: Colors.red,
                        ));
                  },
                )
              ],
            ),
          ),
          Container(
            width: 150.0,
            height: 140.0,
            child: Stack(
              children: [
                Positioned(
                  left: 10.0,
                  right: 10.0,
                  bottom: 20.0,
                  top: 5.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.asset(
                      'assets/IndianStreetFood_20190103000803.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 5.0,
                  left: 10.0,
                  right: 10.0,
                  child: Center(
                      child: Container(
                    decoration: BoxDecoration(
                      color: purpleColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                    child: Text(
                      'Add to cart',
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.w600),
                    ),
                  )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
