part of 'fav_bloc.dart';

abstract class FavEvent extends Equatable {
  const FavEvent();

  @override
  List<Object> get props => [];
}

class StarItem extends FavEvent {}

class AddfavProduct extends FavEvent {
  final Products menuItem;

  const AddfavProduct(this.menuItem);

  @override
  List<Object> get props => [menuItem];
}

class RemovefavProduct extends FavEvent {
  final Products menuItem;

  const RemovefavProduct(this.menuItem);

  @override
  List<Object> get props => [menuItem];
}
