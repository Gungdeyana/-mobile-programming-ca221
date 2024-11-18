import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uts_mobile_programing_220010003/models/animal.dart';

void main() {
  final mockAnimalData = [
    Animal(
      id: '1',
      speciesName: 'Nisaetus bartelsi',
      localName: 'Elang Jawa',
      description: 'Elang Jawa merupakan spesies elang berukuran sedang dari keluarga Accipitriadae dan genus Nisaetus yang merupakan endemik di Pulau Jawa.',
      imageUrl: 'assets/images/elangjawa.jpg',
    ),
    Animal(
      id: '2',
      speciesName: 'Leucopsar rothschildi',
      localName: 'Jalak Bali',
      description: 'Jalak Bali adalah sejenis burung pengicau berukuran sedang, dengan panjang lebih kurang 25 cm, dari suku Sturnidae.',
      imageUrl: 'assets/images/jalakbali.jpg',
    ),
  ];

  testWidgets('HomePage renders correctly', (WidgetTester tester) async {
    
    expect(find.text('Animal Data'), findsOneWidget);

   
    expect(find.byType(ListView), findsOneWidget);

    
    expect(find.text(mockAnimalData[0].localName), findsOneWidget);
  });

  testWidgets('Navigates to DetailPage when a list item is tapped', (WidgetTester tester) async {
   

  
    await tester.tap(find.text(mockAnimalData[0].localName));
    await tester.pumpAndSettle();

   
    expect(find.text(mockAnimalData[0].speciesName), findsOneWidget);
    expect(find.text(mockAnimalData[0].description), findsOneWidget);
  });
}
