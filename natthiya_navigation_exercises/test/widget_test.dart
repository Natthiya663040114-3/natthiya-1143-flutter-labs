import 'package:flutter_test/flutter_test.dart';
import 'package:natthiya_navigation_exercises/main_navigation_quiz.dart';

void main() {
  testWidgets('Quiz app loads correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('Quiz App'), findsOneWidget);
  });
}
