import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_bloc_project/core/Api/BaseApi.dart';
import 'package:internet_handler/logic/internet/internet_cubit.dart';

import 'ApiUrl.dart';

class Api extends BaseApi {
  final String endUrl;
  Api({required this.endUrl});

  /// Converts a Map to FormData.
  FormData _formData(Map<String, dynamic>? json) {
    return FormData.fromMap(json ?? {});
  }

  bool _isFetching = false;
  Completer<void>? _fetchCompleter;

  /// Fetches data from API.
  Future<Map<String, dynamic>> fetch({Map<String, dynamic>? json}) async {
    // Check if already fetching data
    if (_isFetching) {
      // If already fetching, wait until the current fetch completes
      await _fetchCompleter?.future;
      return fetch(json: json); // Retry fetching after current fetch completes
    }

    // Set flag and completer to indicate that fetch is in progress
    _isFetching = true;
    _fetchCompleter = Completer<void>();

    try {
      final isInternetAvailable = await InternetCubit().isInternetAvailable();
      if (!isInternetAvailable) {
        throw NoInternetException("No internet connection.").message;
      }

      FormData data =
          _formData(json); // Adjust this according to your implementation
      final response =
          await dioClient().post(ApiUrl.barUrl + endUrl, data: data);

      // Reset flag and complete completer on successful response
      _isFetching = false;
      _fetchCompleter!.complete();

      return response.data;
    } on DioException catch (e) {
      // Handle DioException
      _isFetching = false;
      _fetchCompleter!.complete();
      if (e.response != null && e.response!.statusCode == 500) {
        throw ("Server error");
      } else {
        throw ("Failed to load data: ${e.message}");
      }
    } on SocketException catch (_) {
      // Handle SocketException
      _isFetching = false;
      _fetchCompleter!.complete();
      throw NoInternetException("No internet connection.").message;
    } catch (e) {
      // Handle other exceptions
      _isFetching = false;
      _fetchCompleter!.complete();
      rethrow;
    }
  }
}

class NoInternetException implements Exception {
  final String message;
  NoInternetException(this.message);
}
