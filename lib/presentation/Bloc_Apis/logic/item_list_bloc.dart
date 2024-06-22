import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/ItemListModel.dart';
import '../repo/item_repo.dart';
part 'item_list_event.dart';
part 'item_list_state.dart';

class ItemListBloc extends Bloc<ItemListEvent, ItemListState> {
  final ItemRepo itemRepo;

  ItemListBloc(this.itemRepo) : super(const ItemListState()) {
    on<ItemListEvent>(_initial);
  }
  void _initial(ItemListEvent event, Emitter<ItemListState> emit) async {
    try {
      // pagination loading condition.
      bool checkLoadingCondition = state.itemListModel != null &&
          (state.limit) >= (state.itemListModel?.totalCount ?? 0);
      // Refresh functionality Screen.
      if (event.refresh) {
        emit(state.copyWith(
            screenLoading: event.refresh,
            error: false,
            limit: 5,
            getMoreLoading: !checkLoadingCondition));
      }
      // pagination loading condition if true then return.
      if (checkLoadingCondition) {
        if (state.getMoreLoading == true) {
          emit(state.copyWith(getMoreLoading: false));
        }
        return;
      }
      // pagination get more data condition.
      int? limit = event.getMoreData ? state.limit + 1 : state.limit;

      // Fetch data from repository
      final itemListModel =
          ItemListModel.fromJson(await itemRepo.fetchGroups(limit: limit));
      // success fully.
      emit(state.copyWith(
          itemListModel: itemListModel,
          limit: limit,
          screenLoading: false,
          error: false,
          getMoreLoading: !checkLoadingCondition));
    } catch (ex) {
      // error handler.
      emit(state.copyWith(
        error: true,
        errorMessage: ex.toString(),
        screenLoading: false,
      ));
    }
  }
  //
  // @override
  // ItemListState? fromJson(Map<String, dynamic> json) {
  //   try {
  //     return state.copyWith(
  //       itemListModel: ItemListModel.fromJson(json),
  //     );
  //   } catch (e) {
  //     log('Error parsing JSON in fromJson: $e');
  //     return null;
  //   }
  // }
  //
  // @override
  // Map<String, dynamic>? toJson(ItemListState state) {
  //   try {
  //     return state.itemListModel?.toJson();
  //   } catch (e) {
  //     log('Error serializing to JSON in toJson: $e');
  //     return null;
  //   }
  // }
}
