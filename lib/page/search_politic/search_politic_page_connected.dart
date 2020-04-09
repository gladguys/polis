import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../core/service/locator.dart';
import '../../core/service/services.dart';
import '../../repository/concrete/repositories.dart';
import '../page_connected.dart';
import '../pages.dart';

class SearchPoliticPageConnected extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageConnected<SearchPoliticBloc>(
      bloc: SearchPoliticBloc(
        userFollowingPoliticsRepository:
            context.repository<FirebaseUserFollowingPoliticsRepository>(),
        followRepository: context.repository<FirebaseFollowRepository>(),
        politicoService: PoliticoService(
          firebaseRepository: context.repository<FirebasePoliticoRepository>(),
          hiveRepository: context.repository<HivePoliticoRepository>(),
          syncLogRepository: context.repository<FirebaseSyncLogRepository>(),
          sharedPreferencesService: G<SharedPreferencesService>(),
        ),
        partidoService: PartidoService(
          firebaseRepository: context.repository<FirebasePartidoRepository>(),
          hiveRepository: context.repository<HivePartidoRepository>(),
          syncLogRepository: context.repository<FirebaseSyncLogRepository>(),
          sharedPreferencesService: G<SharedPreferencesService>(),
        ),
        politicProfileBloc: PoliticProfileBloc(
          user: context.bloc<UserBloc>().user,
          politicProfileRepository:
              context.repository<FirebasePoliticProfileRepository>(),
          followRepository: context.repository<FirebaseFollowRepository>(),
          urlLauncherService: G<UrlLauncherService>(),
        ),
      )..add(FetchPolitics(context.bloc<UserBloc>().user.userId)),
      page: SearchPoliticPage(),
    );
  }
}
