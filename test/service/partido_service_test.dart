import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/service/services.dart';
import 'package:polis/model/models.dart';

import '../mock.dart';

void main() {
  PartidoService partidoService;
  MockFirebasePartidoRepository mockFirebasePartidoRepository;
  MockHivePartidoRepository mockHivePartidoRepository;
  MockSyncLogRepository mockSyncLogRepository;
  MockSharedPreferencesService mockSharedPreferencesService;

  group('PartidoService tests', () {
    setUp(() {
      mockFirebasePartidoRepository = MockFirebasePartidoRepository();
      mockHivePartidoRepository = MockHivePartidoRepository();
      mockSyncLogRepository = MockSyncLogRepository();
      mockSharedPreferencesService = MockSharedPreferencesService();
      partidoService = PartidoService(
        firebaseRepository: mockFirebasePartidoRepository,
        hiveRepository: mockHivePartidoRepository,
        syncLogRepository: mockSyncLogRepository,
        sharedPreferencesService: mockSharedPreferencesService,
      );
    });

    test('asserts', () {
      expect(
          () => PartidoService(
                firebaseRepository: null,
                hiveRepository: MockHivePartidoRepository(),
                syncLogRepository: MockSyncLogRepository(),
                sharedPreferencesService: MockSharedPreferencesService(),
              ),
          throwsAssertionError);

      expect(
          () => PartidoService(
                firebaseRepository: MockFirebasePartidoRepository(),
                hiveRepository: null,
                syncLogRepository: MockSyncLogRepository(),
                sharedPreferencesService: MockSharedPreferencesService(),
              ),
          throwsAssertionError);

      expect(
          () => PartidoService(
                firebaseRepository: MockFirebasePartidoRepository(),
                hiveRepository: MockHivePartidoRepository(),
                syncLogRepository: null,
                sharedPreferencesService: MockSharedPreferencesService(),
              ),
          throwsAssertionError);

      expect(
          () => PartidoService(
                firebaseRepository: MockFirebasePartidoRepository(),
                hiveRepository: MockHivePartidoRepository(),
                syncLogRepository: MockSyncLogRepository(),
                sharedPreferencesService: null,
              ),
          throwsAssertionError);
    });

    group('getAllPartidos', () {
      test('should return partidos from firebase when hashes are diferent',
          () async {
        when(mockSharedPreferencesService.getPartidoHash()).thenReturn('hash1');
        when(mockSyncLogRepository.getPartidoHash())
            .thenAnswer((_) => Future.value('hash2'));
        when(mockHivePartidoRepository.getAllPartidos()).thenAnswer(
          (_) => Future.value([PartidoModel(id: '1')]),
        );
        await partidoService.getAllPartidos();
        verifyNever(mockHivePartidoRepository.getAllPartidos());
        verify(mockFirebasePartidoRepository.getAllPartidos()).called(1);
      });

      test('should return partidos from hive when hashes are identical',
          () async {
        when(mockSharedPreferencesService.getPartidoHash()).thenReturn('hash');
        when(mockSyncLogRepository.getPartidoHash())
            .thenAnswer((_) => Future.value('hash'));
        when(mockHivePartidoRepository.getAllPartidos()).thenAnswer(
          (_) => Future.value([]),
        );
        await partidoService.getAllPartidos();
        verify(mockHivePartidoRepository.getAllPartidos()).called(1);
        verifyNever(mockFirebasePartidoRepository.getAllPartidos());
      });
    });
  });
}
