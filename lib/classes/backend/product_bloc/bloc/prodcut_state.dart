part of 'prodcut_bloc.dart';

abstract class ProdcutState extends Equatable {
  const ProdcutState();

  @override
  List<Object> get props => [];
}

class ProdcutLoading extends ProdcutState {}

class ProdcutLoaded extends ProdcutState {
  final List<Products?> products;

  ProdcutLoaded({this.products = const <Products>[]});

  @override
  List<Object> get props => [products];
}
