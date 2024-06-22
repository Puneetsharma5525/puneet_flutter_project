import 'dart:developer';

import 'package:app_links/app_links.dart';
import 'package:flutter_bloc_project/core/DeepLinking/context_utility.dart';
import 'package:go_router/go_router.dart';

class UniServices {
  static String _code = '';
  static String get code => _code;
  static bool get codeIsPregnant => _code.isNotEmpty;

  static void reset() => _code = '';

  static init() async {
    final appLinks = AppLinks();
    try {
      final Uri? uri = await appLinks.getInitialLink();
      uniHandler(uri);
    } catch (e) {
      rethrow;
    }
    appLinks.uriLinkStream.listen((Uri? uri) {
      uniHandler(uri);
    }, onError: (error) {
      log('On Uri Error : $error');
    });
  }

  static uniHandler(Uri? uri) {
    if (uri == null || uri.queryParameters.isEmpty) return;
    Map<String, String> param = uri.queryParameters;
    String receivedCode = param['page'] ?? '';
    ContextUtility.context?.pushNamed(receivedCode);
  }
}
