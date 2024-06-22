import 'package:equatable/equatable.dart';

class FlutterBlocState extends Equatable {
  final bool toggle;
  final double slider;
  const FlutterBlocState(
      {this.toggle = false,
      this.slider = 0.0, });
  FlutterBlocState copyWith(
      {bool? toggle, bool? checkBox, double? slider, String? changeText}) {
    return FlutterBlocState(
      toggle: toggle ?? this.toggle,
      slider: slider ?? this.slider,
    );
  }

  @override
  List<Object?> get props => [toggle, slider,  ];
}
