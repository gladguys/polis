import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

const HTTP_STATUS_OK = 200;

BaseOptions _getDefaultOptions() {
  return BaseOptions(
    contentType: 'application/json',
    baseUrl: DotEnv().env['API_BASE_URL'],
  );
}

Dio getDefaultClient() {
  return Dio(_getDefaultOptions());
}
