// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'dart:ui';

import 'package:catcher/catcher.dart';
import 'package:fcross_platui/app/screens/mybase/managers/my_base.dart';
import 'package:fcross_platui/app/screens/myhomepage/managers/my_home_page.dart';
import 'package:fcross_platui/app/shared/app_title.dart';
import 'package:fcross_platui/app/themes/my_cupertino_color_scheme.dart';
import 'package:fcross_platui/app/themes/my_cupertino_text_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class AppState extends State<MyBase> {
  Brightness brightness = Brightness.light;
  @override
  Widget build(BuildContext context) {
    return Theme(
        data:
            brightness == Brightness.light ? ThemeData.from(colorScheme: const ColorScheme.light()) : ThemeData.from(colorScheme: const ColorScheme.dark()),
        child: PlatformProvider(
          //initialPlatform: TargetPlatform.iOS,
          //no do not make const
          // ignore: prefer_const_constructors
          // ignore: prefer-trailing-comma
          builder: (context) => PlatformApp(
                // getx settings go here
                
                debugShowCheckedModeBanner: false,
                navigatorKey: Catcher.navigatorKey,

                // ignore: prefer_const_literals_to_create_immutables
                localizationsDelegates: <LocalizationsDelegate<dynamic>>[
                  DefaultMaterialLocalizations.delegate,
                  DefaultWidgetsLocalizations.delegate,
                  DefaultCupertinoLocalizations.delegate,
                ],
                title: 'Base River',
                material: (_, __) {
                  return MaterialAppData(
                    // per this doc page:
                    // https://api.flutter.dev/flutter/material/ThemeData/ThemeData.from.html
                    // need to use this form of setting material themes as 
                    // colors of widget components are derived form the colorscheme
                    theme: ThemeData.from(colorScheme: const ColorScheme.light()),
                    darkTheme: ThemeData.from(colorScheme: const ColorScheme.dark()),
                    themeMode: brightness == Brightness.light
                        ? ThemeMode.light
                        : ThemeMode.dark,
                  );
                },
                cupertino: (_, __) => CupertinoAppData(
                  theme: CupertinoThemeData(
                      brightness: brightness, // if null will use the system theme
                      // ignore: prefer_const_constructors
                      primaryColor: myCupertinoPrimaryColor,
                      primaryContrastingColor:
                          myCupertinoPrimaryContrastingColor,
                      textTheme: myCupertinoTextThemeData,
                      // ignore: prefer-trailing-comma
                      barBackgroundColor: Colors.transparent),
                ),
                //home: SplashScreen.navigate(
                  //name: '2-2-tree.riv',
                  //next: (context) => const MyHomePage(),
                 // until: () =>
                   //   Future<dynamic>.delayed(const Duration(seconds: 5)),
                  //startAnimation: 'tree',
                //),
                home: const MyHomePage( title: appTitle),
                
              )),
        );
  }
}

