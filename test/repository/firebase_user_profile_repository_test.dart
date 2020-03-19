import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/repository/concrete/firebase/collection.dart';
import 'package:polis/repository/concrete/firebase/firebase_user_profile_repository.dart';

import '../mock.dart';

void main() {
  group('FirebaseUserProfileRepository tests', () {
    FirebaseUserProfileRepository firebaseUserProfileRepository;
    MockFirestore mockFirestore;
    MockQuerySnapshot mockQuerySnapshot;
    MockDocumentSnapshot mockDocumentSnapshot;
    MockDocumentReference mockDocumentReference;
    MockCollectionReference mockCollectionReference;
    MockCollectionReference mockPoliticsFollowingCollectionReference;
    List<MockDocumentSnapshot> mockDocumentSnapshotList;

    setUp(() {
      mockFirestore = MockFirestore();
      mockDocumentReference = MockDocumentReference();
      mockQuerySnapshot = MockQuerySnapshot();
      firebaseUserProfileRepository = FirebaseUserProfileRepository(
        firestore: mockFirestore,
      );
      mockDocumentSnapshot = MockDocumentSnapshot();
      mockCollectionReference = MockCollectionReference();
      mockDocumentSnapshotList = [
        mockDocumentSnapshot,
      ];
    });

    test('test asserts', () {
      expect(
          () => FirebaseUserProfileRepository(
                firestore: null,
              ),
          throwsAssertionError);
    });

    group('getPoliticsFollowing tests', () {
      test('return [PoliticoModel] with list of following politics', () async {
        when(mockFirestore.collection(FOLLOWING))
            .thenReturn(mockCollectionReference);
        when(mockCollectionReference.document('1'))
            .thenReturn(mockDocumentReference);
        when(mockDocumentReference.collection(POLITICOS_FOLLOWING))
            .thenReturn(mockPoliticsFollowingCollectionReference);
        when(mockPoliticsFollowingCollectionReference.getDocuments())
            .thenAnswer((_) => Future.value(mockQuerySnapshot));
        when(mockQuerySnapshot.documents).thenReturn([]);
        final politicsFollowing =
            await firebaseUserProfileRepository.getPoliticsFollowing('1');
      });
    });
  });
}
