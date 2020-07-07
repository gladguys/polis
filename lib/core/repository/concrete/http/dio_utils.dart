import 'package:dio/dio.dart';

const HTTP_STATUS_OK = 200;

BaseOptions _getDefaultOptions() {
  return BaseOptions(
    contentType: 'application/json',
    baseUrl: 'http://192.168.0.22:8080/api/',
  );
}

Dio getDefaultClient() {
  return Dio(_getDefaultOptions());
}
