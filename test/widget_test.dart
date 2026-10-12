// Basic Flutter widget test for the login screen.

import 'package:flutter_test/flutter_test.dart';

import 'package:demo_login_app/main.dart';
import 'package:demo_login_app/core/constants/app_constants.dart';

void main() {
  testWidgets('LoginScreen shows title and login button', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const DemoLoginApp());

    // Verify that the app title and login button are rendered.
    expect(find.text(AppConstants.appName), findsOneWidget);
    expect(find.text('Masuk'), findsOneWidget);
  });
}
