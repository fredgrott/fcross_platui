// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.




import 'package:fcross_platui/app/screens/mybase/managers/my_base.dart';
import 'package:fcross_platui/app/screens/myhomepage/managers/my_home_page.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:golden_toolkit/golden_toolkit.dart';



void main() {
   WidgetsFlutterBinding.ensureInitialized();
  group('Basic Golden Tests ', () {
    testWidgets('Golden test', (WidgetTester tester) async {
      await tester.pumpWidget(MyBase());
      await expectLater(find.byType(MyBase), matchesGoldenFile('main.png'));
    });
    testGoldens('DeviceBuilder ', (tester) async {
      final builder = DeviceBuilder()
        ..overrideDevicesForAllScenarios(devices: [
          Device.phone,
          Device.iphone11,
          Device.tabletPortrait,
          Device.tabletLandscape,
        ])
        ..addScenario(
          widget: const MyHomePage(title:"FCross Platui",),
          name: 'default page',
        );
      await tester.pumpDeviceBuilder(builder);
      await screenMatchesGolden(tester, "demo page multiple screens");
    });
  });

}