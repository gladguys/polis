import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/service/locator.dart';
import 'package:polis/model/models.dart';
import 'package:polis/page/pages.dart';
import 'package:polis/widget/my_app.dart';
import 'package:polis/widget/my_app_injections.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../mock.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({
    'USER': null,
  });
  const channel = MethodChannel('plugins.flutter.io/firebase_performance');
  channel.setMockMethodCallHandler((methodCall) async => true);
  initLocator(await SharedPreferences.getInstance());

  group('MyApp tests', () {
    test('assert', () {
      expect(
          () => MyApp(
                sharedPreferencesService: null,
              ),
          throwsAssertionError);
    });

    testWidgets('MyApp tests', (tester) async {
      final mockSharedPreferencesService = MockSharedPreferencesService();
      when(mockSharedPreferencesService.getUser()).thenReturn(
        UserModel(
          userId: '1',
        ),
      );
      when(mockSharedPreferencesService.isUserLogged()).thenReturn(false);
      await tester.pumpWidget(
        MyAppInjections(
          child: MyApp(
            sharedPreferencesService: mockSharedPreferencesService,
          ),
        ),
      );
      final context = tester.element(find.byType(InitialPage));
      expect(find.byType(MyApp), findsOneWidget);
      expect(context.bloc<UserBloc>(), isNotNull);
    });

    testWidgets('Should go to timeline when user is logged', (tester) async {
      final mockSharedPreferencesService = MockSharedPreferencesService();
      when(mockSharedPreferencesService.getUser()).thenReturn(
        UserModel(
          userId: '1',
        ),
      );
      when(mockSharedPreferencesService.isUserLogged()).thenReturn(true);
      await tester.pumpWidget(
        MyAppInjections(
          child: MyApp(
            sharedPreferencesService: mockSharedPreferencesService,
          ),
        ),
      );
      expect(find.byType(TimelinePage), findsOneWidget);
    });
  });
}
