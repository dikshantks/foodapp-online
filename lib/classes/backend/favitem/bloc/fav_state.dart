part of 'fav_bloc.dart';

abstract class FavState extends Equatable {
  const FavState();

  @override
  List<Object> get props => [];
}

class FavListLoading extends FavState {}

class FavListLoaded extends FavState {
  final FavItemModal favItemModal;

  const FavListLoaded({
    this.favItemModal = const FavItemModal(),
  });

  @override
  List<Object> get props => [favItemModal];
}

class FavListError extends FavState {}
