import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personal_assistant/main.dart';

void main() {
  testWidgets('Ana sayfa başlık testi', (WidgetTester tester) async {
    await tester.pumpWidget(PersonalAssistantApp());

    expect(find.text('Kişisel Asistan'), findsOneWidget);
    expect(find.text('Görevler'), findsOneWidget);
    expect(find.text('Notlar'), findsOneWidget);
    expect(find.text('Hatırlatıcılar'), findsOneWidget);
    expect(find.text('Hava Durumu'), findsOneWidget);
  });
}
