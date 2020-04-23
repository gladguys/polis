import 'package:admob_flutter/admob_flutter.dart';

const ADMOB_APP_ID = 'ca-app-pub-5806526425473649~5721958482';

class AdService {
  void initAds() {
    Admob.initialize(ADMOB_APP_ID);
  }
}
