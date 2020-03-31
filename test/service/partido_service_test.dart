import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/service/services.dart';
import 'package:polis/model/models.dart';

import '../mock.dart';

void main() {
  PartidoService partidoService;
  MockFirebasePartidoRepository mockFirebasePartidoRepository;
  MockHivePartidoRepository mockHivePartidoRepository;

  group('PartidoService tests', () {
    setUp(() {
      mockFirebasePartidoRepository = MockFirebasePartidoRepository();
      mockHivePartidoRepository = MockHivePartidoRepository();
      partidoService = PartidoService(
        firebaseRepository: mockFirebasePartidoRepository,
        hiveRepository: mockHivePartidoRepository,
      );
    });

    test('asserts', () {
      expect(
          () => PartidoService(
              firebaseRepository: null,
              hiveRepository: MockHivePartidoRepository()),
          throwsAssertionError);

      expect(
          () => PartidoService(
              firebaseRepository: MockFirebasePartidoRepository(),
              hiveRepository: null),
          throwsAssertionError);
    });

    group('getAllPartidos', () {
      test('should return partidos from hive when theres cache', () async {
        when(mockHivePartidoRepository.getAllPartidos()).thenAnswer(
          (_) => Future.value([PartidoModel(id: '1')]),
        );
        await partidoService.getAllPartidos();
        verify(mockHivePartidoRepository.getAllPartidos()).called(1);
        verifyNever(mockFirebasePartidoRepository.getAllPartidos());
      });

      test('should return partidos from firebase when theres no cache',
          () async {
        when(mockHivePartidoRepository.getAllPartidos()).thenAnswer(
          (_) => Future.value([]),
        );
        await partidoService.getAllPartidos();
        verify(mockHivePartidoRepository.getAllPartidos()).called(1);
        verify(mockFirebasePartidoRepository.getAllPartidos()).called(1);
      });
    });
  });
}
