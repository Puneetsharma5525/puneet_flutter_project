import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/flutter_bloc_example/flutter_bloc_example_bloc.dart';
import '../logic/flutter_bloc_example/flutter_bloc_example_event.dart';
import '../logic/flutter_bloc_example/flutter_bloc_example_state.dart';

class SliderScreen extends StatelessWidget {
  const SliderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int currentStep = 0;

    return Center(
      child: BlocProvider<FlutterBlocExample>(
        create: (context) => FlutterBlocExample(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Flutter Bloc Examples"),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  leading: const Text("Notification"),
                  trailing: BlocBuilder<FlutterBlocExample, FlutterBlocState>(

                    buildWhen: (previews,current)=>previews.toggle != current.toggle,
                    builder: (context, state) {
                      return Switch(
                        onChanged: (value) {
                          context
                              .read<FlutterBlocExample>()
                              .add(EnableDisableToggleEvent());
                        },
                        value: state.toggle,
                      );
                    },
                  ),
                ),
                BlocBuilder<FlutterBlocExample, FlutterBlocState>(

                  buildWhen: (previews,current)=>previews.slider != current.slider,
                  builder: (context, state) {
                    return Slider(
                      value: state.slider,
                      onChanged: (value) {
                        context
                            .read<FlutterBlocExample>()
                            .add(ChangeSliderEvent(slider: value));
                      },
                    );
                  },
                ),


                Stepper(
                  currentStep: currentStep,
                  onStepTapped: (int step) {
                    currentStep = step;
                  },
                  onStepContinue: () {
                    if (currentStep < 2) {
                      currentStep += 1;
                    }
                  },
                  onStepCancel: () {
                    if (currentStep > 0) {
                      currentStep -= 1;
                    }
                  },
                  steps: const <Step>[
                    Step(
                      title: Text('Step 1'),
                      content: Text('This is the content for Step 1'),
                    ),
                    Step(
                      title: Text('Step 2'),
                      content: Text('This is the content for Step 2'),
                    ),
                    Step(
                      title: Text('Step 3'),
                      content: Text('This is the content for Step 3'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
