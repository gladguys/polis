import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/service/locator.dart';
import 'package:polis/page/pages.dart';
import 'package:polis/widget/my_app.dart';
import 'package:polis/widget/my_app_injections.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({
    'USER': null,
  });
  initLocator(await SharedPreferences.getInstance());

  testWidgets('MyApp tests', (tester) async {
    await tester.pumpWidget(
      MyAppInjections(
        child: MyApp(),
      ),
    );
    final context = tester.element(find.byType(InitialPage));
    expect(find.byType(MyApp), findsOneWidget);
    expect(context.bloc<UserBloc>(), isNotNull);
  });
}
