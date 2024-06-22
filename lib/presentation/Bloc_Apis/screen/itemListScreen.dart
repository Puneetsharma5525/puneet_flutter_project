import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_project/core/SizeBox.dart';
import 'package:flutter_bloc_project/core/popAppMessage.dart';
import 'package:flutter_bloc_project/core/theme.dart';
import 'package:flutter_bloc_project/presentation/Bloc_Apis/model/Data.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../core/paginationFuncation.dart';
import '../../../core/themeCubit/theme_cubit.dart';
import '../logic/item_list_bloc.dart';


class BlocApisScreen extends StatelessWidget {
  const BlocApisScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final listItemBloc = context
        .read<ItemListBloc>();
    ScrollController scroll = ScrollController();

    DateTime? currentBackPressTime;
    final w = MediaQuery.sizeOf(context).width;
    paginationFunction(
      controller: scroll,
      fun: () {
        listItemBloc
            .add(const ItemListEvent(getMoreData: true, refresh: false));
      },
    );
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) =>
          exitApp(currentBackPressTime: currentBackPressTime),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          /// [useMaterial3]
          forceMaterialTransparency: true,
          title: Text(
            "Profile Api",
            style: GoogleFonts.poppins(),
          ),
          bottom: PreferredSize(
            preferredSize: const Size(
              double.infinity,
              0.5,
            ),
            child: Row(
              children: [
                buildExpanded(context.theme.cardColor),
                // buildExpanded(const Color(0xFF29D3E8)),
                // buildExpanded(const Color(0xFF18C737)),
                // buildExpanded(const Color(0xFFFFCC05)),
                // buildExpanded(const Color(0xFFFD1960)),
              ],
            ),
          ),
        ),
        body: RefreshIndicator(
          // color: context.theme.cardColor,
          // backgroundColor: mainColor,
          onRefresh: () async {
            listItemBloc
                .add(const ItemListEvent(refresh: true,getMoreData: false));
          },
          child: BlocBuilder<ItemListBloc, ItemListState>(
              builder: (context, state) {
                if (state.screenLoading == true) {
                  return Center(
                      child: LoadingAnimationWidget.threeArchedCircle(
                        size: 55,
                        color: context.theme.cardColor,
                      ));
                }
                if (state.error == true) {
                  return Center(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Center(
                          child: Text(state.errorMessage ?? ''),
                        ),
                      ],
                    ),
                  );
                }
                final itemLength =  state.itemListModel?.data?.length ?? 0;
                return AnimationLimiter(
                  child: ListView.builder(
                    controller: scroll,
                    shrinkWrap: true,
                    padding: EdgeInsets.all(w / 30),
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: itemLength + 1,
                    itemBuilder: (BuildContext context, int index) {
                      if (index < itemLength) {
                        final data = state.itemListModel?.data?[index];
                        return buildGestureDetector(data,context);
                      }
                      if(state.getMoreLoading == true) {
                    return Center(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: LoadingAnimationWidget.hexagonDots(
                        size: 25,
                        color: context.theme.cardColor,
                      ),
                    ));
                  }
                      return const SizedBox.shrink();
                },
                  ),
                );
              }),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: IconButton(
              onPressed: () async{
                context.read<ThemeCubit>().updateTheme(await context.read<ThemeCubit>().getBool());
              },
              icon: Icon(
                Icons.dark_mode,
                color: context.theme.colorScheme.onError,
              )),
        ),
      ),
    );
  }

  GestureDetector buildGestureDetector(Data? data,BuildContext context)=> GestureDetector(
    onTap: () {},
    child: Card(
      color:   cardColor(context),
      margin: const EdgeInsets.only(bottom: 8),
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 0, vertical: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: CachedNetworkImage(
                  imageUrl: data?.image ?? "",
                  placeholder: (context, url) => Center(
                      child: LoadingAnimationWidget
                          .hexagonDots(
                        size: 25,
                        color: context.theme.cardColor,
                      )),
                  errorWidget: (context, url, error) =>
                      Icon(
                        Icons.error,
                        color: context.theme.cardColor,
                      ),
                  height: 120,
                  width: 120,
                  fit: BoxFit.fill,
                  // decoration: BoxDecoration(
                  //     borderRadius:
                  //         BorderRadius.circular(15)),
                ),
              ),
            ),
            10.width,
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 12, bottom: 12, right: 15),
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Text(
                      data?.name ?? "",
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color:
                        deemColor(context),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    2.height,
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      children: [
                        Text(data?.price ?? "",
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                color:
                                deemColor(context),
                                fontWeight:
                                FontWeight.w700)),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Text(
                              "₹ ${data?.mrp ?? ""}",
                              style: GoogleFonts.poppins(
                                  decoration: TextDecoration
                                      .lineThrough,
                                  decorationColor:
                                    deemColor(context),
                                  decorationThickness: 2,
                                  fontSize: 11,
                                  color:
                                  deemColor(context),
                                  fontWeight:
                                  FontWeight.w500)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    if (data?.isInCart
                        ?.toLowerCase() ==
                        'yes') ...[
                      SizedBox(
                        height: 25,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(5),
                            ),
                            padding: EdgeInsets.zero,
                          ),

                          child: Text(
                            "View cart",
                            style: GoogleFonts.poppins(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,),
                          ),
                        ),
                      )
                    ] else ...[
                      SizedBox(
                        height: 25,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                                width: 1.2,
                                color: context.theme.cardColor),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(5),
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          child: Padding(
                            padding:
                            const EdgeInsets.symmetric(
                                horizontal: 8),
                            child: Text(
                              "Add to cart",
                              style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  fontWeight:
                                  FontWeight.w600,
                                  color: context.theme.cardColor),
                            ),
                          ),
                        ),
                      )
                    ]
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );

  Expanded buildExpanded(Color color)=>Expanded(
    child: Container(
      height: 0.5,
      color: color,
    ),
  );
}
