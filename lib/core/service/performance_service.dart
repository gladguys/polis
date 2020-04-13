import 'package:firebase_performance/firebase_performance.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class PerformanceService {
  PerformanceService({this.performance});

  FirebasePerformance performance;

  Future<Trace> getTimelineTrace({@required String trace}) async {
    assert(trace != null);
    final performanceTrace = await performance.newTrace(trace);
    performanceTrace.putAttribute('PAGE_SIZE', kTimelinePageSize.toString());
    return performanceTrace;
  }
}
