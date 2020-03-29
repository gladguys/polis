import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/model/despesa_model.dart';
import 'package:polis/model/proposta_model.dart';
import 'package:tuple/tuple.dart';

import '../mock.dart';

void main() {
  group('TimelineBloc tests', () {
    TimelineBloc timelineBloc;
    MockTimelineRepository mockTimelineRepository;
    Stream<Tuple2<List<DespesaModel>, List<PropostaModel>>> timelineStream;

    setUp(() {
      mockTimelineRepository = MockTimelineRepository();
      timelineBloc = TimelineBloc(
        repository: mockTimelineRepository,
      );
      timelineStream = Stream.value(
        const Tuple2(<DespesaModel>[], <PropostaModel>[]),
      );
    });

    test('asserts', () {
      expect(
          () => TimelineBloc(
                repository: null,
              ),
          throwsAssertionError);
    });

    test('''Expects InitialTimelineState to be the initial state''', () {
      expect(timelineBloc.state, equals(InitialTimelineState()));
    });

    blocTest(
      '''Expects [UpdateTimeline]''',
      build: () async {
        when(mockTimelineRepository.getUserTimeline('1')).thenAnswer(
          (_) => timelineStream,
        );
        return timelineBloc;
      },
      act: (timelineBloc) {
        timelineBloc.add(FetchUserTimeline('1'));
        timelineBloc.add(
          UpdateTimeline(
            despesas: [],
            propostas: [],
          ),
        );
        return;
      },
      verify: (timelineBloc) async {
        verify(mockTimelineRepository.getUserTimeline('1')).called(1);
      },
      expect: [
        TimelineUpdated(
          despesas: [],
          propostas: [],
        ),
      ],
    );

    blocTest(
      '''Expects [FetchTimelineFailed]''',
      build: () async {
        when(mockTimelineRepository.getUserTimeline('1'))
            .thenThrow(Exception());
        return timelineBloc;
      },
      act: (timelineBloc) {
        timelineBloc.add(FetchUserTimeline('1'));
        return;
      },
      verify: (timelineBloc) async {
        verify(mockTimelineRepository.getUserTimeline('1')).called(1);
      },
      expect: [
        FetchTimelineFailed(),
      ],
    );
  });
}
