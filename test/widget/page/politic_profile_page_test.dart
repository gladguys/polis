import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/i18n/i18n.dart';
import 'package:polis/model/models.dart';
import 'package:polis/page/page_connected.dart';
import 'package:polis/page/pages.dart';
import 'package:polis/page/politic_profile/widget/politic_action_buttons.dart';
import 'package:polis/page/politic_profile/widget/politic_activities.dart';
import 'package:polis/page/politic_profile/widget/politic_additional_info.dart';
import 'package:polis/page/politic_profile/widget/politic_personal_info.dart';

import '../../mock.dart';
import '../utils.dart';

void main() {
  MockPoliticProfileBloc mockPoliticProfileBloc;

  group('PoliticProfilePage tests', () {
    setUp(() {
      mockPoliticProfileBloc = MockPoliticProfileBloc();
    });

    testWidgets('should build without exploding', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PoliticProfileBloc>(
            bloc: mockPoliticProfileBloc,
            page: PoliticProfilePage(),
          ),
        ),
      );
    });

    testWidgets('should build connected without exploding', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          PoliticProfilePageConnected('1'),
        ),
      );
    });

    testWidgets('should bring info when success', (tester) async {
      when(mockPoliticProfileBloc.state).thenReturn(
        GetPoliticInfoSuccess(
          politic: PoliticoModel(
            id: '1',
            siglaPartido: 'PT',
            urlFoto: 'foto',
            nomeEleitoral: 'nomeE',
            siglaUf: 'CE',
          ),
        ),
      );
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PoliticProfileBloc>(
            bloc: mockPoliticProfileBloc,
            page: PoliticProfilePage(),
          ),
        ),
      );
      expect(find.byType(PoliticPersonalInfo), findsOneWidget);
      expect(find.byType(PoliticActionButtons), findsOneWidget);
      expect(find.byType(PoliticAdditionalInfo), findsOneWidget);
      expect(find.byType(PoliticActivities), findsOneWidget);
    });

    testWidgets('should show error msg when fails', (tester) async {
      when(mockPoliticProfileBloc.state).thenReturn(GetPoliticInfoFailed());
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PoliticProfileBloc>(
            bloc: mockPoliticProfileBloc,
            page: PoliticProfilePage(),
          ),
        ),
      );
      expect(find.text(ERROR_FETCHING_POLITIC_INFO), findsOneWidget);
    });
  });
}
