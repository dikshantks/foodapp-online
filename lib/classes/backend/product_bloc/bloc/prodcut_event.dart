part of 'prodcut_bloc.dart';

abstract class ProdcutEvent extends Equatable {
  const ProdcutEvent();

  @override
  List<Object> get props => [];
}

class LoadProducts extends ProdcutEvent {}

class UpdateProduct extends ProdcutEvent {
  final List<Products> products;

  UpdateProduct(this.products);

  @override
  List<Object> get props => [products];
}
