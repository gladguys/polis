import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'main_commom.dart' as commom;

void main() async {
  await DotEnv().load('.env_local');
  commom.main();
}
