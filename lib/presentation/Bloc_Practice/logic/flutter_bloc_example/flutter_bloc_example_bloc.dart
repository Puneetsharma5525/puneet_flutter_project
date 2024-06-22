import 'package:flutter_bloc/flutter_bloc.dart';
import 'flutter_bloc_example_event.dart';
import 'flutter_bloc_example_state.dart';

class FlutterBlocExample extends Bloc<FlutterBlocEvent, FlutterBlocState> {
  FlutterBlocExample() : super(const FlutterBlocState()) {
    on<EnableDisableToggleEvent>(_enableDisableToggle);
    on<ChangeSliderEvent>(_changeSlider);
  }

  void _enableDisableToggle(
    EnableDisableToggleEvent event,
    Emitter<FlutterBlocState> emit,
  ) {
    emit(state.copyWith(toggle: !state.toggle));
  }

  void _changeSlider(
    ChangeSliderEvent event,
    Emitter<FlutterBlocState> emit,
  ) {
    emit(state.copyWith(slider: event.slider));
  }


  @override
  void add(FlutterBlocEvent event) {
    // TODO: implement add
    print("Add");
    super.add(event);
  }
  @override
  void addError(Object error, [StackTrace? stackTrace]) {
    print("Add Error");
    super.addError(error, stackTrace);
  }
  @override
  void onChange(Change<FlutterBlocState> change) {
    print("On Change");
    super.onChange(change);
  }

  @override
  void onTransition(Transition<FlutterBlocEvent, FlutterBlocState> transition) {
    print("On transition");
    // TODO: implement onTransition
    super.onTransition(transition);
  }
  @override
  void onEvent(FlutterBlocEvent event) {
    print("Event");
    // TODO: implement onEvent
    super.onEvent(event);
  }
  @override
  void onError(Object error, StackTrace stackTrace) {
    print("eRrro");
    // TODO: implement onError
    super.onError(error, stackTrace);
  }




}
