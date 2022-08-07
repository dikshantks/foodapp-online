// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tmp_online/classes/Modal/fav.dart';
import 'package:tmp_online/tests/menu_test.dart';

part 'fav_event.dart';
part 'fav_state.dart';

class FavBloc extends Bloc<FavEvent, FavState> {
  FavBloc() : super(FavListLoading()) {
    on<StarItem>(_onloadFilter);

    on<AddfavProduct>(_onAddItem);

    on<RemovefavProduct>(_onRemove);
  }

  void _onloadFilter(
    FavEvent event,
    Emitter<FavState> emit,
  ) async {
    emit(FavListLoading());
    try {
      await Future<void>.delayed(Duration(seconds: 2));

      emit(FavListLoaded());
    } catch (e) {
      print(e);
    }
  }

  void _onAddItem(
    AddfavProduct event,
    Emitter<FavState> emit,
  ) async {
    final state = this.state;

    if (state is FavListLoaded) {
      try {
        emit(
          FavListLoaded(
            favItemModal: FavItemModal(
              Favitems: List.from(
                state.favItemModal.Favitems,
              )..add(event.menuItem),
            ),
          ),
        );
      } catch (e) {
        print(e);
      }
    }
  }

  void _onRemove(
    RemovefavProduct event,
    Emitter<FavState> emit,
  ) async {
    final state = this.state;

    if (state is FavListLoaded) {
      try {
        emit(
          FavListLoaded(
            favItemModal: FavItemModal(
              Favitems: List.from(
                state.favItemModal.Favitems,
              )..remove(event.menuItem),
            ),
          ),
        );
      } catch (e) {}
    }
  }
}
