import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

const HTTP_STATUS_OK = 200;

const jsonPlaceholder = 'https://my-json-server.typicode.com/gladguys/polis/';

BaseOptions _getDefaultOptions() {
  return BaseOptions(
    contentType: 'application/json',
    baseUrl: DotEnv().env['API_BASE_URL'],
  );
}

Dio getDefaultClient() {
  return Dio(_getDefaultOptions());
}

extension IsResponseOk on Response {
  bool get isOk => statusCode == HTTP_STATUS_OK;
}
