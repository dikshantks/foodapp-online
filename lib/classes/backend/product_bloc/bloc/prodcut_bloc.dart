import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_database/ui/utils/stream_subscriber_mixin.dart';
import 'package:tmp_online/classes/menu_items/menu_item_model.dart';
import 'package:tmp_online/classes/menu_items/repository/product_repo.dart';

part 'prodcut_event.dart';
part 'prodcut_state.dart';

class ProdcutBloc extends Bloc<ProdcutEvent, ProdcutState> {
  final ProductRepo _productRepo;

  StreamSubscription? _productSubscription;

  ProdcutBloc({required ProductRepo productRepo})
      : _productRepo = productRepo,
        super(ProdcutLoading()) {
    on<LoadProducts>(_onLoadProduct);
  }

  Future<void> _onLoadProduct(
    LoadProducts event,
    Emitter<ProdcutState> emit,
  ) async {
    _productSubscription?.cancel();
    _productSubscription = _productRepo
        .getAllProducts()
        .listen((products) => add(UpdateProduct(products)));
  }

  Future<void> _onUpdateProduct(
    UpdateProduct event,
    Emitter<ProdcutState> emit,
  ) async {
    ProdcutLoaded(products: event.products);
  }
}
