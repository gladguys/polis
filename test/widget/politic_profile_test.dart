import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/page/page_connected.dart';
import 'package:polis/page/politic_profile/widget/politic_profile.dart';

import '../mock.dart';
import '../utils.dart';

void main() {
  testWidgets('should adapt persistentContentHeight for smaller screens',
      (tester) async {
    final mockPoliticProfileBloc = MockPoliticProfileBloc();
    when(mockPoliticProfileBloc.politico).thenReturn(
      PoliticoModel(
        id: '1',
        nomeEleitoral: 'nome',
        urlPartidoLogo: 'urllogo',
        urlFoto: 'foto',
      ),
    );
    when(mockPoliticProfileBloc.lastActivities).thenReturn([]);
    when(mockPoliticProfileBloc.isPoliticBeingFollowedByUser).thenReturn(false);
    await tester.pumpWidget(
      connectedWidget(
        MediaQuery(
          data: const MediaQueryData(
            size: Size(400, 200),
          ),
          child: PageConnected<PoliticProfileBloc>(
            bloc: mockPoliticProfileBloc,
            page: Scaffold(
              body: PoliticProfile(
                InitialPoliticProfileState(),
              ),
            ),
          ),
        ),
      ),
    );
  });
}
