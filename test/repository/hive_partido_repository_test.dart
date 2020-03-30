import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/model/models.dart';
import 'package:polis/repository/concrete/hive/box.dart';
import 'package:polis/repository/concrete/repositories.dart';

import '../mock.dart';

void main() {
  HivePartidoRepository hivePartidoRepository;
  MockHive mockHive;
  MockPartidoBox mockPartidoBox;

  group('HivePartidoRepository', () {
    setUp(() {
      mockHive = MockHive();
      hivePartidoRepository = HivePartidoRepository(
        hive: mockHive,
      );
      mockPartidoBox = MockPartidoBox();
    });

    test('asserts', () {
      expect(() => HivePartidoRepository(hive: null), throwsAssertionError);
    });

    group('getAllPartidos', () {
      test('return [PartidoModel] when box is not empty', () async {
        when(mockHive.openBox<PartidoModel>(PARTIDOS_BOX))
            .thenAnswer((_) => Future.value(mockPartidoBox));
        when(mockHive.box<PartidoModel>(PARTIDOS_BOX))
            .thenReturn(mockPartidoBox);
        when(mockPartidoBox.values).thenReturn([PartidoModel(id: '1')]);
        final partidos = await hivePartidoRepository.getAllPartidos();
        expect(partidos, isNotEmpty);
      });

      test('returns [] when box is empty', () async {
        when(mockHive.openBox<PartidoModel>(PARTIDOS_BOX))
            .thenAnswer((_) => Future.value(mockPartidoBox));
        when(mockHive.box<PartidoModel>(PARTIDOS_BOX))
            .thenReturn(mockPartidoBox);
        when(mockPartidoBox.values).thenReturn(const Iterable.empty());
        final partidos = await hivePartidoRepository.getAllPartidos();
        expect(partidos, isEmpty);
      });

      test('throws exception', () async {
        when(mockHive.openBox<PartidoModel>(PARTIDOS_BOX))
            .thenThrow(Exception());
        hivePartidoRepository
            .getAllPartidos()
            .catchError((e) => expect(e, isA<Exception>()));
      });
    });

    group('storeAllPartidos', () {
      test('calls box.add n times', () async {
        when(mockHive.openBox<PartidoModel>(PARTIDOS_BOX))
            .thenAnswer((_) => Future.value(mockPartidoBox));
        when(mockHive.box<PartidoModel>(PARTIDOS_BOX))
            .thenReturn(mockPartidoBox);
        await hivePartidoRepository.storeAllPartidos([
          PartidoModel(id: '1'),
          PartidoModel(id: '2'),
        ]);
        verify(mockPartidoBox.add(any)).called(2);
      });

      test('calls box.add 0 times when list is empty', () async {
        when(mockHive.openBox<PartidoModel>(PARTIDOS_BOX))
            .thenAnswer((_) => Future.value(mockPartidoBox));
        when(mockHive.box<PartidoModel>(PARTIDOS_BOX))
            .thenReturn(mockPartidoBox);
        await hivePartidoRepository.storeAllPartidos([]);
        verifyNever(mockPartidoBox.add(any));
      });

      test('throws exception', () async {
        when(mockHive.openBox<PartidoModel>(PARTIDOS_BOX))
            .thenThrow(Exception());
        hivePartidoRepository.storeAllPartidos([]).catchError(
            (e) => expect(e, isA<Exception>()));
      });
    });
  });
}
