import 'package:dio/dio.dart';

const HTTP_STATUS_OK = 200;

BaseOptions _getDefaultOptions() {
  return BaseOptions(
    baseUrl: 'http://3.128.107.25:8080/api/',
  );
}

Dio getDefaultClient() {
  return Dio(_getDefaultOptions());
}
