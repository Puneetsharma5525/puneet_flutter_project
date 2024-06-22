part of 'item_list_bloc.dart';

class ItemListEvent extends Equatable {
  final bool refresh;
  final bool getMoreData;
  const ItemListEvent({
    this.refresh = false,
    this.getMoreData = false,
  });
  @override
  List<Object?> get props => [refresh, getMoreData];
}


