// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'constants.dart';
import '../tests/menu_test.dart';

class MyWidget extends StatefulWidget {
  MyWidget(
      {Key? key,
      required this.currentItem,
      required this.iswishlist,
      required this.onpress})
      : super(key: key);

  final bool iswishlist;
  void onpress;

  MenuItems currentItem;

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
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
      height: 150.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            // color: Colors.blue,
            width: 150.0,
            alignment: Alignment.topLeft,
            child: Column(
              children: [
                Text(
                  "${widget.currentItem.name}",
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Rs ${widget.currentItem.price}',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                widget.iswishlist
                    ? IconButton(
                        onPressed: () => widget.onpress,
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.red,
                          semanticLabel: 'Save',
                        ),
                      )
                    : IconButton(
                        onPressed: () => widget.onpress,
                        icon: Icon(
                          Icons.favorite_border,
                          color: Colors.red,
                          semanticLabel: 'Not Save',
                        ),
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
