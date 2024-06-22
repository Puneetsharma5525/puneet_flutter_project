import 'package:flutter/material.dart';
import 'package:flutter_bloc_project/core/theme.dart';
import 'package:go_router/go_router.dart';
import '../../../core/common/color.dart';
import '../component/Data.dart';
import '../component/item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:   Text("Home Page",style: TextStyle(color: whiteColor,),),
        backgroundColor: appColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: iterable
              .map((e) => Item(
                    text: e.itemName ?? '',
                    color: Colors.primaries[e.index].shade300,
                    onTap: () {
                      if (e.pushNamed?.isNotEmpty == true) {
                        context.pushNamed(e.pushNamed!);
                      }
                    },
                  ))
              .toList(),
        ),
      ),
    );
  }
}
