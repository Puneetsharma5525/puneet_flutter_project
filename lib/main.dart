import 'dart:io';
import 'package:flutter_bloc_project/core/DeepLinking/uni_services.dart';
import 'package:flutter_bloc_project/core/themeCubit/theme_state.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:internet_handler/logic/internet/internet_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/DependencyInjection.dart';
import 'core/Router/Router.dart';
import 'core/themeCubit/theme_cubit.dart';

// 👉 firebase integrated ( login & sign up).
// 👉 google signup & github or other.
// 👉 settings screen ( notification permission , theme mode , other).
// 👉 google map live location picker.
// 👉 signature & scanner.
// 👉 web view & notification chat & live streaming with agora.
// 👉 pdf view , exel view doc view , live location fetch.
// 👉 ar/vr.
// 👉 app widget , chat ai.
// 👉 animation ui.
// 👉 payment gateway.


//To bypass the ssl certificate handshake issue on android 8 below devices
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DependencyInjection().serviceLocator();
  //To bypass the ssl certificate handshake issue on android 8 below devices
  HttpOverrides.global = MyHttpOverrides();
  final bool isDark =
      (await SharedPreferences.getInstance()).getBool('isDark') ?? true;
  await UniServices.init();
  //Hydrated storage initialization
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeCubit>(
      create: (context) => ThemeCubit(ThemeState()),
      child: Builder(builder: (context) {
        return MultiBlocProvider(
          providers: [
            // BlocProvider<ThemeCubit>(
            //   create: (context) => ThemeCubit(ThemeState()),
            // ),
            BlocProvider<InternetCubit>(
              create: (context) => getIt(),
            ),
          ],
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: MaterialApp.router(
              theme: context.read<ThemeCubit>().getTheme(),
              routerConfig: RouteGo().returnRouter(),
              title: 'Flutter Project',
              // darkTheme: CustomThemeData.lightTheme,
              debugShowCheckedModeBanner: false,
              locale: const Locale('en'),
              supportedLocales: const [
                Locale('en'),
                Locale('hi'),
              ],
            ),
          ),
        );
      }),
    );
  }
}
