import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_project/comman/widget/deep_link_icon.dart';
import 'package:flutter_bloc_project/core/Router/Router.dart';
import '../../../core/common/color.dart';
import '../logic/counterBloc/counter_bloc.dart';
import '../logic/counterBloc/counter_event.dart';
import '../logic/counterBloc/counter_state.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (context) => CounterBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: whiteColor),
            title: Text(
              "Counter Bloc",
              style: TextStyle(color: whiteColor),
            ),
            actions: [
              DeepLinkIcon(
                page: RouteGo.counterScreen,
              )
            ],
            backgroundColor: appColor,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<CounterBloc, CounterState>(
                  builder: (context, state) {
                    debugPrint("->->->->");
                    return Text(state.counter.toString());
                  },
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        context.read<CounterBloc>().add(IncrementEvent());
                      },
                      child: const Icon(Icons.add),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        context.read<CounterBloc>().add(DecrementEvent());
                      },
                      child: const Icon(Icons.remove),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
