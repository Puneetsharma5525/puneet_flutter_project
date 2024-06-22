import 'dart:developer';

import 'package:flutter_bloc_project/core/Api/api.dart';
import '../../../core/Api/BaseApi.dart';

class ItemRepo extends BaseApi {
  Future<Map<String, dynamic>> fetchGroups({
    required int limit,
    String keyword = '',
  }) async {
    log(limit.toString());
    Api api = Api(endUrl: 'profiles');
    try {
      return await api.fetch(json: {
        'start': '0',
        'limit': limit,
        'sid': 'qwert',
        'keyword': keyword
      });
    } catch (e) {
      log('issue $e');
      rethrow;
    }
  }
}
