import 'package:equatable/equatable.dart';
import 'package:tmp_online/tests/menu_test.dart';

class FavItemModal extends Equatable {
  final List<MenuItems> Favitems;

  const FavItemModal({
    this.Favitems = const <MenuItems>[],
  });

  @override
  List<Object?> get props => [Favitems];
}
