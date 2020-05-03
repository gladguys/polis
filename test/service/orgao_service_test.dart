import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/service/services.dart';
import 'package:polis/model/models.dart';

import '../mock.dart';

void main() {
  OrgaoService orgaoService;
  MockFirebaseOrgaoRepository mockFirebaseOrgaoRepository;
  MockHiveOrgaoRepository mockHiveOrgaoRepository;
  MockSyncLogRepository mockSyncLogRepository;
  MockSharedPreferencesService mockSharedPreferencesService;

  group('PartidoService tests', () {
    setUp(() {
      mockFirebaseOrgaoRepository = MockFirebaseOrgaoRepository();
      mockHiveOrgaoRepository = MockHiveOrgaoRepository();
      mockSyncLogRepository = MockSyncLogRepository();
      mockSharedPreferencesService = MockSharedPreferencesService();
      orgaoService = OrgaoService(
        firebaseRepository: mockFirebaseOrgaoRepository,
        hiveRepository: mockHiveOrgaoRepository,
        syncLogRepository: mockSyncLogRepository,
        sharedPreferencesService: mockSharedPreferencesService,
      );
    });

    test('asserts', () {
      expect(
          () => OrgaoService(
                firebaseRepository: null,
                hiveRepository: MockHiveOrgaoRepository(),
                syncLogRepository: MockSyncLogRepository(),
                sharedPreferencesService: MockSharedPreferencesService(),
              ),
          throwsAssertionError);

      expect(
          () => OrgaoService(
                firebaseRepository: MockFirebaseOrgaoRepository(),
                hiveRepository: null,
                syncLogRepository: MockSyncLogRepository(),
                sharedPreferencesService: MockSharedPreferencesService(),
              ),
          throwsAssertionError);

      expect(
          () => OrgaoService(
                firebaseRepository: MockFirebaseOrgaoRepository(),
                hiveRepository: MockHiveOrgaoRepository(),
                syncLogRepository: null,
                sharedPreferencesService: MockSharedPreferencesService(),
              ),
          throwsAssertionError);

      expect(
          () => OrgaoService(
                firebaseRepository: MockFirebaseOrgaoRepository(),
                hiveRepository: MockHiveOrgaoRepository(),
                syncLogRepository: MockSyncLogRepository(),
                sharedPreferencesService: null,
              ),
          throwsAssertionError);
    });

    group('getAllOrgaosMap', () {
      test(
          '''should return orgaos in a map from firebase when hashes are diferent''',
          () async {
        when(mockSharedPreferencesService.getOrgaoHash()).thenReturn('hash1');
        when(mockSyncLogRepository.getOrgaoHash())
            .thenAnswer((_) => Future.value('hash2'));
        when(mockHiveOrgaoRepository.getAllOrgaosMap()).thenAnswer(
          (_) => Future.value({
            'T': OrgaoModel(
              apelido: 'Teste',
              nome: 'Teste',
              id: '1',
              sigla: 'T',
            )
          }),
        );
        await orgaoService.getAllOrgaosMap();
        verifyNever(mockHiveOrgaoRepository.getAllOrgaosMap());
        verify(mockFirebaseOrgaoRepository.getAllOrgaosMap()).called(1);
      });

      test('should return orgaos from hive when hashes are identical',
          () async {
        when(mockSharedPreferencesService.getOrgaoHash()).thenReturn('hash');
        when(mockSyncLogRepository.getOrgaoHash())
            .thenAnswer((_) => Future.value('hash'));
        when(mockHiveOrgaoRepository.getAllOrgaosMap()).thenAnswer(
          (_) => Future.value({}),
        );
        await orgaoService.getAllOrgaosMap();
        verify(mockHiveOrgaoRepository.getAllOrgaosMap()).called(1);
        verifyNever(mockFirebaseOrgaoRepository.getAllOrgaosMap());
      });
    });
  });
}
