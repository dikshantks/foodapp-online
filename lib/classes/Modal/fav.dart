import 'package:equatable/equatable.dart';
import 'package:tmp_online/classes/menu_items/menu_item_model.dart';
import 'package:tmp_online/tests/menu_test.dart';

class FavItemModal extends Equatable {
  final List<Products> Favitems;

  const FavItemModal({
    this.Favitems = const <Products>[],
  });

  @override
  List<Object?> get props => [Favitems];
}
