

import '../../../core/Router/Router.dart';
import '../model/ItemModel.dart';

Iterable<ItemModel> iterable = [
  ItemModel(
    index: 0,
    itemName: 'Flutter Bloc Counter',
    pushNamed: RouteGo.counterScreen,
  ),
  ItemModel(
    index: 1,
    itemName: 'Flutter Slider Bloc',
    pushNamed: RouteGo.sliderScreen,
  ),ItemModel(
    index: 2,
    itemName: 'Flutter Api Bloc',
    pushNamed: RouteGo.blocApisScreen,
  ),
];
