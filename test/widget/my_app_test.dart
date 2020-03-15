import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/service/locator.dart';
import 'package:polis/page/pages.dart';
import 'package:polis/widget/my_app.dart';

void main() {
  initLocator();

  testWidgets('MyApp tests', (tester) async {
    await tester.pumpWidget(MyApp());
    final context = tester.element(find.byType(SigninPage));
    expect(find.byType(MyApp), findsOneWidget);
    expect(context.bloc<UserBloc>(), isNotNull);
  });
}
