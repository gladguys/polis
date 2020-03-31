import 'package:tuple/tuple.dart';

import '../../model/models.dart';

abstract class TimelineRepository {
  Stream<Tuple2<List<DespesaModel>, List<PropostaModel>>> getUserTimeline(
      String userId);
}
