import 'package:tuple/tuple.dart';

import '../../model/despesa_model.dart';
import '../../model/proposta_model.dart';

abstract class TimelineRepository {
  Stream<Tuple2<List<DespesaModel>, List<PropostaModel>>> getUserTimeline(
      String userId);
}
