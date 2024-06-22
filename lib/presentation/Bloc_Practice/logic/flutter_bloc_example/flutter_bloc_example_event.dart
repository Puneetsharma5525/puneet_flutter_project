import 'package:equatable/equatable.dart';

abstract class FlutterBlocEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

// toggle
class EnableDisableToggleEvent extends FlutterBlocEvent {}

// Slider
class ChangeSliderEvent extends FlutterBlocEvent {
  final double slider;
  ChangeSliderEvent({this.slider = 0.0});

  @override
  List<Object?> get props => [slider];
}