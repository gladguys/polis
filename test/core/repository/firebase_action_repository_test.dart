import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/domain/enum/acao_type.dart';
import 'package:polis/core/domain/enum/post_type.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/core/exception/comunication_exception.dart';
import 'package:polis/core/i18n/i18n.dart';
import 'package:polis/core/repository/concrete/firebase/firebase.dart';
import 'package:polis/core/repository/concrete/repositories.dart';

import '../../mock.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting('pt_BR', null);

  FirebaseActionRepository firebaseActionRepository;
  MockFirestore mockFirestore;
  MockPoliticoService mockPoliticoService;
  MockCollectionReference mockActionsCollectionReference;
  MockCollectionReference mockUserActionsSubcollectionReference;
  MockCollectionReference mockPoliticosCollectionReference;
  MockDocumentReference mockUserDocumentReference;

  group('FirebaseActionRepository tests', () {
    setUp(() {
      mockActionsCollectionReference = MockCollectionReference();
      mockPoliticosCollectionReference = MockCollectionReference();
      mockUserActionsSubcollectionReference = MockCollectionReference();
      mockUserDocumentReference = MockDocumentReference();
      mockFirestore = MockFirestore();
      mockPoliticoService = MockPoliticoService();
      firebaseActionRepository = FirebaseActionRepository(
        firestore: mockFirestore,
        politicoService: mockPoliticoService,
      );
    });

    test('test asserts', () {
      expect(
          () => FirebaseActionRepository(
                firestore: null,
                politicoService: mockPoliticoService,
              ),
          throwsAssertionError);
      expect(
          () => FirebaseActionRepository(
                firestore: mockFirestore,
                politicoService: null,
              ),
          throwsAssertionError);
    });

    group('saveUserAction', () {
      test('should work', () async {
        when(mockPoliticoService.getPoliticoById('1')).thenAnswer(
          (_) => Future.value(
            PoliticoModel(
              sexo: MALE,
            ),
          ),
        );
        when(mockFirestore.collection(ACOES_COLLECTION))
            .thenReturn(mockActionsCollectionReference);
        when(mockActionsCollectionReference.document('1'))
            .thenReturn(mockUserDocumentReference);
        when(mockUserDocumentReference.collection(ACOES_USUARIO_SUBCOLLECTION))
            .thenReturn(mockUserActionsSubcollectionReference);
        when(mockUserActionsSubcollectionReference.add(any))
            .thenAnswer((_) => Future.value());
        await firebaseActionRepository.saveUserAction(
          user: UserModel(
            userId: '1',
          ),
          acao: AcaoUsuarioModel(
              nomePolitico: 'nome',
              sexoPolitico: MALE,
              data: DateTime.now(),
              mensagem: 'msg',
              idPolitico: '1',
              idPost: '1',
              tipo: AcaoType.follow,
              tipoPost: PostType.PROPOSICAO,
              urlFotoPolitico: 'foto'),
        );
      });

      test('should work', () async {
        when(mockPoliticoService.getPoliticoById('1')).thenThrow(Exception());
        firebaseActionRepository
            .saveUserAction(
              user: UserModel(
                userId: '1',
              ),
              acao: AcaoUsuarioModel(
                  nomePolitico: 'nome',
                  sexoPolitico: MALE,
                  data: DateTime.now(),
                  mensagem: 'msg',
                  idPolitico: '1',
                  idPost: '1',
                  tipo: AcaoType.follow,
                  tipoPost: PostType.PROPOSICAO,
                  urlFotoPolitico: 'foto'),
            )
            .catchError((e) => expect(e, isA<ComunicationException>()));
      });
    });
  });
}
