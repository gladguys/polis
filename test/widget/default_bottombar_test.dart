import 'package:bloc_test/bloc_test.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/keys.dart';
import 'package:polis/core/service/locator.dart';
import 'package:polis/model/models.dart';
import 'package:polis/page/pages.dart';
import 'package:polis/widget/my_app_injections.dart';

import '../mock.dart';
import 'utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    const channel = MethodChannel('plugins.flutter.io/firebase_performance');
    channel.setMockMethodCallHandler((methodCall) async => true);
    initLocator(MockSharedPreferences());
  });

  group('DefaultBottombar tests', () {
    testWidgets('shoud build without exploding', (tester) async {
      final mockUserBloc = MockUserBloc();
      when(mockUserBloc.user).thenReturn(UserModel());
      await tester.pumpWidget(
        connectedWidget(
          BlocProvider(
            create: (_) => mockUserBloc,
            child: TimelinePageConnected(),
          ),
        ),
      );
    });

    testWidgets('shoud build icons on bottombar', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          BlocProvider(
            create: (_) => UserBloc(
              repository: MockUserRepository(),
              user: UserModel(
                photoUrl: 'photo',
              ),
              analyticsService: MockAnalyticsService(),
              sharedPreferencesService: MockSharedPreferencesService(),
            ),
            child: TimelinePageConnected(),
          ),
        ),
      );
      final homeIcon = find.byWidgetPredicate((widget) {
        if (widget is FlatButton && widget.child is FaIcon) {
          return (widget.child as FaIcon).icon == FontAwesomeIcons.home;
        }
        return false;
      });
      expect(homeIcon, findsOneWidget);
      final searchIcon = find.byWidgetPredicate((widget) {
        if (widget is FlatButton && widget.child is FaIcon) {
          return (widget.child as FaIcon).icon == FontAwesomeIcons.search;
        }
        return false;
      });
      expect(searchIcon, findsOneWidget);
      final bookmarkIcon = find.byWidgetPredicate((widget) {
        if (widget is FlatButton && widget.child is FaIcon) {
          return (widget.child as FaIcon).icon ==
              FontAwesomeIcons.solidBookmark;
        }
        return false;
      });
      expect(bookmarkIcon, findsOneWidget);
    });

    testWidgets('shoud show profile image when user has one', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          BlocProvider(
            create: (_) => UserBloc(
              repository: MockUserRepository(),
              user: UserModel(
                photoUrl: 'photo',
              ),
              analyticsService: MockAnalyticsService(),
              sharedPreferencesService: MockSharedPreferencesService(),
            ),
            child: TimelinePageConnected(),
          ),
        ),
      );
      expect(find.byType(FancyShimmerImage), findsOneWidget);
    });

    testWidgets('shoud show default icon when user has no photo',
        (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          BlocProvider(
            create: (_) => UserBloc(
              repository: MockUserRepository(),
              user: UserModel(),
              analyticsService: MockAnalyticsService(),
              sharedPreferencesService: MockSharedPreferencesService(),
            ),
            child: TimelinePageConnected(),
          ),
        ),
      );
      expect(find.byKey(userPhotolessIconKey), findsOneWidget);
    });

    testWidgets('shoud go to TimelinePage when clicking home icon',
        (tester) async {
      final mockUserBloc = MockUserBloc();
      when(mockUserBloc.user).thenReturn(UserModel());
      await tester.pumpWidget(
        connectedWidget(
          BlocProvider(
            create: (_) => mockUserBloc,
            child: TimelinePageConnected(),
          ),
        ),
      );
      final homeIcon = find.byWidgetPredicate((widget) {
        if (widget is FlatButton && widget.child is FaIcon) {
          return (widget.child as FaIcon).icon == FontAwesomeIcons.home;
        }
        return false;
      });
      expect(homeIcon, findsOneWidget);
      await tester.tap(homeIcon);
    });

    testWidgets(
        '''shoud go to TimelinePage when clicking home icon and not on TimelinePage yet''',
        (tester) async {
      final mockUserBloc = MockUserBloc();
      when(mockUserBloc.user).thenReturn(UserModel());
      await tester.pumpWidget(
        connectedWidget(
          BlocProvider(
            create: (_) => mockUserBloc,
            child: FavoritePostsPageConnected(),
          ),
        ),
      );
      final homeIcon = find.byWidgetPredicate((widget) {
        if (widget is FlatButton && widget.child is FaIcon) {
          return (widget.child as FaIcon).icon == FontAwesomeIcons.home;
        }
        return false;
      });
      expect(homeIcon, findsOneWidget);
      await tester.tap(homeIcon);
    });

    testWidgets('shoud go to SearchPoliticPage when clicking search icon',
        (tester) async {
      final mockUserBloc = MockUserBloc();
      when(mockUserBloc.user).thenReturn(UserModel());
      await tester.pumpWidget(
        connectedWidget(
          BlocProvider(
            create: (_) => mockUserBloc,
            child: TimelinePageConnected(),
          ),
        ),
      );
      final searchIcon = find.byWidgetPredicate((widget) {
        if (widget is FlatButton && widget.child is FaIcon) {
          return (widget.child as FaIcon).icon == FontAwesomeIcons.search;
        }
        return false;
      });
      expect(searchIcon, findsOneWidget);
      await tester.tap(searchIcon);
    });

    testWidgets('shoud go to FavoritePostsPage when clicking bookmark icon',
        (tester) async {
      final mockUserBloc = MockUserBloc();
      when(mockUserBloc.user).thenReturn(UserModel());
      await tester.pumpWidget(
        connectedWidget(
          BlocProvider(
            create: (_) => mockUserBloc,
            child: TimelinePageConnected(),
          ),
        ),
      );
      final bookmarkIcon = find.byWidgetPredicate((widget) {
        if (widget is FlatButton && widget.child is FaIcon) {
          return (widget.child as FaIcon).icon ==
              FontAwesomeIcons.solidBookmark;
        }
        return false;
      });
      expect(bookmarkIcon, findsOneWidget);
      await tester.tap(bookmarkIcon);
    });

    testWidgets('shoud go to UserProfilePage page when clicking on photo',
        (tester) async {
      final mockUserBloc = MockUserBloc();
      when(mockUserBloc.user).thenReturn(UserModel());
      await tester.pumpWidget(
        connectedWidget(
          BlocProvider(
            create: (_) => mockUserBloc,
            child: TimelinePageConnected(),
          ),
        ),
      );
      final profile = find.byKey(profileImageBottombarKey);
      expect(profile, findsOneWidget);
      await tester.tap(profile);
      await tester.pump();
      await tester.pump();
      expect(find.byType(UserProfilePage), findsOneWidget);
    });

    testWidgets('shoud update user photo when state change', (tester) async {
      final mockUserBloc = MockUserBloc();
      whenListen(
        mockUserBloc,
        Stream.fromIterable(
          [
            InitialUser(),
            SignoutSucceded(),
            CurrentUserUpdated(
              UserModel(
                photoUrl: 'photourl',
              ),
            ),
          ],
        ),
      );
      await tester.pumpWidget(
        connectedWidget(
          BlocProvider(
            create: (_) => mockUserBloc,
            child: TimelinePageConnected(),
          ),
        ),
      );
    });

    testWidgets('shoud show photo from the state when changed', (tester) async {
      final mockUserBloc = MockUserBloc();
      when(mockUserBloc.user).thenReturn(
        UserModel(
          userId: '1',
        ),
      );
      when(mockUserBloc.state).thenReturn(
        CurrentUserUpdated(
          UserModel(
            photoUrl: 'photourl',
          ),
        ),
      );
      await tester.pumpWidget(
        MyAppInjections(
          child: BlocProvider<UserBloc>(
            create: (_) => mockUserBloc,
            child: MaterialApp(
              navigatorObservers: [
                mockObserver,
              ],
              home: TimelinePageConnected(),
            ),
          ),
        ),
      );
    });
  });
}
