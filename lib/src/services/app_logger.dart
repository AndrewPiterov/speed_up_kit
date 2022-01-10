import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'package:speed_up_kit/src/models/models.dart';

abstract class IDeveloperLogger {
  Iterable<AppLogData> get logs;

  Future catchException(Exception exception, StackTrace stackTrace);
  Future captureHttpError(DioError e);
  void info(dynamic data);
  void warn(dynamic data);
  void error(dynamic data);
}

class DeveloperLogger extends GetxService implements IDeveloperLogger {
  final _logs = <AppLogData>[].obs;

  @override
  Iterable<AppLogData> get logs => _logs;

  @override
  Future catchException(Exception exception, StackTrace stackTrace) async {
    error(exception.toString());
  }

  @override
  Future captureHttpError(DioError e) async {
    final errors = e.response!.statusCode == 400
        ? e.response!.data['errors'] as Map<String, dynamic>
        : {};
    log(errors.toString(), name: 'HTTP RESPONSE ERRORS');
    _logs.add(AppLogData(DateTime.now(), Loglevel.error, errors.toString()));
  }

  @override
  void info(data) {
    log(data.toString());
    _logs.add(AppLogData(DateTime.now(), Loglevel.info, data.toString()));
  }

  @override
  void warn(data) {
    log(data.toString());
    _logs.add(AppLogData(DateTime.now(), Loglevel.warning, data.toString()));
  }

  @override
  void error(data) {
    log(data.toString());
    _logs.add(AppLogData(DateTime.now(), Loglevel.error, data.toString()));
  }
}
