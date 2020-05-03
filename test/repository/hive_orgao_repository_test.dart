import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/model/models.dart';
import 'package:polis/repository/concrete/hive/box.dart';
import 'package:polis/repository/concrete/repositories.dart';

import '../mock.dart';

void main() {
  HiveOrgaoRepository hiveOrgaoRepository;
  MockHive mockHive;
  MockOrgaoBox mockOrgaoBox;

  group('HivePoliticoRepository tests', () {
    setUp(() {
      mockHive = MockHive();
      hiveOrgaoRepository = HiveOrgaoRepository(
        hive: mockHive,
      );
      mockOrgaoBox = MockOrgaoBox();
    });

    test('asserts', () {
      expect(() => HiveOrgaoRepository(hive: null), throwsAssertionError);
    });

    group('getAllOrgaosMap', () {
      test('return {getAllOrgaosMap} when box is not empty', () async {
        when(mockHive.openBox<OrgaoModel>(ORGAOS_BOX))
            .thenAnswer((_) => Future.value(mockOrgaoBox));
        when(mockHive.box<OrgaoModel>(ORGAOS_BOX)).thenReturn(mockOrgaoBox);
        when(mockOrgaoBox.values).thenReturn([OrgaoModel(id: '1', sigla: 'T')]);
        final politicosMap = await hiveOrgaoRepository.getAllOrgaosMap();
        print(politicosMap.runtimeType);
        expect(politicosMap, isNotEmpty);
      });

      test('returns [] when box is empty', () async {
        when(mockHive.openBox<OrgaoModel>(ORGAOS_BOX))
            .thenAnswer((_) => Future.value(mockOrgaoBox));
        when(mockHive.box<OrgaoModel>(ORGAOS_BOX)).thenReturn(mockOrgaoBox);
        when(mockOrgaoBox.values).thenReturn(const Iterable.empty());
        final politicosMap = await hiveOrgaoRepository.getAllOrgaosMap();
        expect(politicosMap, isEmpty);
      });

      test('throws exception', () async {
        when(mockHive.openBox<OrgaoModel>(ORGAOS_BOX)).thenThrow(Exception());
        hiveOrgaoRepository
            .getAllOrgaosMap()
            .catchError((e) => expect(e, isA<Exception>()));
      });
    });

    group('storeAllOrgaos', () {
      test('calls box.add n times', () async {
        when(mockHive.openBox<OrgaoModel>(ORGAOS_BOX))
            .thenAnswer((_) => Future.value(mockOrgaoBox));
        when(mockHive.box<OrgaoModel>(ORGAOS_BOX)).thenReturn(mockOrgaoBox);
        await hiveOrgaoRepository.storeAllOrgaos([
          OrgaoModel(id: '1'),
          OrgaoModel(id: '2'),
        ]);
        verify(mockOrgaoBox.clear()).called(1);
        verify(mockOrgaoBox.add(any)).called(2);
      });

      test('calls box.add 0 times when list is empty', () async {
        when(mockHive.openBox<OrgaoModel>(ORGAOS_BOX))
            .thenAnswer((_) => Future.value(mockOrgaoBox));
        when(mockHive.box<OrgaoModel>(ORGAOS_BOX)).thenReturn(mockOrgaoBox);
        await hiveOrgaoRepository.storeAllOrgaos([]);
        verify(mockOrgaoBox.clear()).called(1);
        verifyNever(mockOrgaoBox.add(any));
      });

      test('throws exception', () async {
        when(mockHive.openBox<OrgaoModel>(ORGAOS_BOX)).thenThrow(Exception());
        hiveOrgaoRepository
            .storeAllOrgaos([]).catchError((e) => expect(e, isA<Exception>()));
      });
    });
  });
}
