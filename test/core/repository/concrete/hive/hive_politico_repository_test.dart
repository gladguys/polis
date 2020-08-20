import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/core/repository/concrete/hive/box.dart';
import 'package:polis/core/repository/concrete/repositories.dart';

import '../../../../mock.dart';

void main() {
  HivePoliticoRepository hivePoliticoRepository;
  MockHive mockHive;
  MockPoliticoBox mockPoliticoBox;

  group('HivePoliticoRepository tests', () {
    setUp(() {
      mockHive = MockHive();
      hivePoliticoRepository = HivePoliticoRepository(
        hive: mockHive,
      );
      mockPoliticoBox = MockPoliticoBox();
    });

    test('asserts', () {
      expect(() => HivePoliticoRepository(hive: null), throwsAssertionError);
    });

    group('getAllPoliticos', () {
      test('return [PoliticoModel] when box is not empty', () async {
        when(mockHive.openBox<PoliticoModel>(POLITICOS_BOX))
            .thenAnswer((_) => Future.value(mockPoliticoBox));
        when(mockHive.box<PoliticoModel>(POLITICOS_BOX))
            .thenReturn(mockPoliticoBox);
        when(mockPoliticoBox.values).thenReturn([PoliticoModel(id: '1')]);
        final politicos = await hivePoliticoRepository.getAllPoliticos();
        expect(politicos, isNotEmpty);
      });

      test('returns [] when box is empty', () async {
        when(mockHive.openBox<PoliticoModel>(POLITICOS_BOX))
            .thenAnswer((_) => Future.value(mockPoliticoBox));
        when(mockHive.box<PoliticoModel>(POLITICOS_BOX))
            .thenReturn(mockPoliticoBox);
        when(mockPoliticoBox.values).thenReturn(const Iterable.empty());
        final politicos = await hivePoliticoRepository.getAllPoliticos();
        expect(politicos, isEmpty);
      });

      test('throws exception', () async {
        when(mockHive.openBox<PoliticoModel>(POLITICOS_BOX))
            .thenThrow(Exception());
        hivePoliticoRepository
            .getAllPoliticos()
            .catchError((e) => expect(e, isA<Exception>()));
      });
    });

    group('storeAllPoliticos', () {
      test('calls box.add n times', () async {
        when(mockHive.openBox<PoliticoModel>(POLITICOS_BOX))
            .thenAnswer((_) => Future.value(mockPoliticoBox));
        when(mockHive.box<PoliticoModel>(POLITICOS_BOX))
            .thenReturn(mockPoliticoBox);
        await hivePoliticoRepository.storeAllPoliticos([
          PoliticoModel(id: '1'),
          PoliticoModel(id: '2'),
        ]);
        verify(mockPoliticoBox.clear()).called(1);
        verify(mockPoliticoBox.add(any)).called(2);
      });

      test('calls box.add 0 times when list is empty', () async {
        when(mockHive.openBox<PoliticoModel>(POLITICOS_BOX))
            .thenAnswer((_) => Future.value(mockPoliticoBox));
        when(mockHive.box<PoliticoModel>(POLITICOS_BOX))
            .thenReturn(mockPoliticoBox);
        await hivePoliticoRepository.storeAllPoliticos([]);
        verify(mockPoliticoBox.clear()).called(1);
        verifyNever(mockPoliticoBox.add(any));
      });

      test('throws exception', () async {
        when(mockHive.openBox<PoliticoModel>(POLITICOS_BOX))
            .thenThrow(Exception());
        hivePoliticoRepository.storeAllPoliticos([]).catchError(
            (e) => expect(e, isA<Exception>()));
      });
    });
  });
}
