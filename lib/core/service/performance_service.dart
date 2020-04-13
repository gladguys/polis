import 'package:firebase_performance/firebase_performance.dart';
import 'package:flutter/material.dart';

class PerformanceService {
  PerformanceService({this.performance});

  FirebasePerformance performance;

  Future<Trace> getTrace({@required String trace}) async {
    assert(trace != null);
    final performanceTrace = performance.newTrace(trace);
    return performanceTrace;
  }
}
