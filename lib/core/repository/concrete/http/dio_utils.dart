import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../utils/polis_utils.dart';

enum API {
  main,
  scrapper,
}

const HTTP_STATUS_OK = 200;

BaseOptions _getDefaultOptions(API api) {
  return BaseOptions(
    contentType: 'application/json',
    baseUrl: _getBaseUrl(api),
  );
}

String _getBaseUrl(API api) {
  if (isTest()) {
    return 'MOCK_API_URL';
  }
  return api == API.main
      ? DotEnv().env['MAIN_API_BASE_URL']
      : DotEnv().env['SCRAPPER_API_BASE_URL'];
}

Dio getMainApiDefaultClient() {
  return Dio(_getDefaultOptions(API.main));
}

Dio getScrapperApiDefaultClient() {
  return Dio(_getDefaultOptions(API.scrapper));
}

extension IsResponseOk on Response {
  bool get isOk => statusCode == HTTP_STATUS_OK;
}
