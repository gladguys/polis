import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/core/service/services.dart';

import '../../mock.dart';

void main() {
  PoliticoService politicoService;
  MockFirebasePoliticoRepository mockFirebasePoliticoRepository;
  MockHivePoliticoRepository mockHivePoliticoRepository;
  MockSyncLogRepository mockSyncLogRepository;
  MockSharedPreferencesService mockSharedPreferencesService;

  group('PartidoService tests', () {
    setUp(() {
      mockFirebasePoliticoRepository = MockFirebasePoliticoRepository();
      mockHivePoliticoRepository = MockHivePoliticoRepository();
      mockSyncLogRepository = MockSyncLogRepository();
      mockSharedPreferencesService = MockSharedPreferencesService();
      politicoService = PoliticoService(
        firebaseRepository: mockFirebasePoliticoRepository,
        hiveRepository: mockHivePoliticoRepository,
        syncLogRepository: mockSyncLogRepository,
        sharedPreferencesService: mockSharedPreferencesService,
      );
    });

    test('asserts', () {
      expect(
          () => PoliticoService(
                firebaseRepository: null,
                hiveRepository: MockHivePoliticoRepository(),
                syncLogRepository: MockSyncLogRepository(),
                sharedPreferencesService: MockSharedPreferencesService(),
              ),
          throwsAssertionError);

      expect(
          () => PoliticoService(
                firebaseRepository: MockFirebasePoliticoRepository(),
                hiveRepository: null,
                syncLogRepository: MockSyncLogRepository(),
                sharedPreferencesService: MockSharedPreferencesService(),
              ),
          throwsAssertionError);

      expect(
          () => PoliticoService(
                firebaseRepository: MockFirebasePoliticoRepository(),
                hiveRepository: MockHivePoliticoRepository(),
                syncLogRepository: null,
                sharedPreferencesService: MockSharedPreferencesService(),
              ),
          throwsAssertionError);

      expect(
          () => PoliticoService(
                firebaseRepository: MockFirebasePoliticoRepository(),
                hiveRepository: MockHivePoliticoRepository(),
                syncLogRepository: MockSyncLogRepository(),
                sharedPreferencesService: null,
              ),
          throwsAssertionError);
    });

    group('getAllPoliticos', () {
      test('should return politicos from firebase when hashes are diferent',
          () async {
        when(mockSharedPreferencesService.getPoliticoHash())
            .thenReturn('hash1');
        when(mockSyncLogRepository.getPoliticoHash())
            .thenAnswer((_) => Future.value('hash2'));
        when(mockHivePoliticoRepository.getAllPoliticos()).thenAnswer(
          (_) => Future.value([PoliticoModel(id: '1')]),
        );
        await politicoService.getAllPoliticos();
        verifyNever(mockHivePoliticoRepository.getAllPoliticos());
        verify(mockFirebasePoliticoRepository.getAllPoliticos()).called(1);
      });

      test('should return politicos from hive when hashes are identical',
          () async {
        when(mockSharedPreferencesService.getPartidoHash()).thenReturn('hash');
        when(mockSyncLogRepository.getPartidoHash())
            .thenAnswer((_) => Future.value('hash'));
        when(mockHivePoliticoRepository.getAllPoliticos()).thenAnswer(
          (_) => Future.value([]),
        );
        await politicoService.getAllPoliticos();
        verify(mockHivePoliticoRepository.getAllPoliticos()).called(1);
        verifyNever(mockFirebasePoliticoRepository.getAllPoliticos());
      });
    });
  });
}
