part of 'item_list_bloc.dart';

class ItemListState extends Equatable {
  final ItemListModel? itemListModel;
  final bool? screenLoading;
  final int limit;
  final bool? error;
  final bool? getMoreLoading;
  final String? errorMessage;
  const ItemListState(
      {this.itemListModel,
      this.limit = 5,
      this.screenLoading,
      this.getMoreLoading,
      this.error,
      this.errorMessage});

  ItemListState copyWith(
      {ItemListModel? itemListModel,
      final bool? screenLoading,
      final int? limit,
      final bool? error,
      final bool? getMoreLoading,
      final String? errorMessage}) {
    return ItemListState(
        limit: limit ?? this.limit,
        error: error ?? this.error,
        itemListModel: itemListModel ?? this.itemListModel,
        screenLoading: screenLoading ?? this.screenLoading,
        getMoreLoading: getMoreLoading ?? this.getMoreLoading,
        errorMessage: errorMessage ?? this.errorMessage);
  }

  @override
  List<Object?> get props =>
      [itemListModel, screenLoading, error, errorMessage, limit, getMoreLoading];
}
