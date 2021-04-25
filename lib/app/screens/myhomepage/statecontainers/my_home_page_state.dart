// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.



import 'package:fcross_platui/app/data/models/counter_mixin.dart';
import 'package:fcross_platui/app/screens/myhomepage/managers/my_home_page.dart';
import 'package:fcross_platui/app/shared/app_title.dart';
import 'package:fcross_platui/app/themes/my_cupertino_navigation_bar_data.dart';
import 'package:fcross_platui/app/themes/my_cupertino_page_scaffold_data.dart';
import 'package:fcross_platui/app/themes/my_material_app_bar_data.dart';
import 'package:fcross_platui/app/themes/my_material_scaffold_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';


class MyHomePageState extends State<MyHomePage> with CounterMixin{
  

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      myCounter++;
    });
  }

  @override
  // ignore: long-method
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.transparent,
          
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarDividerColor: Colors.transparent,
        ),
        // ignore: prefer-trailing-comma
        child: PlatformScaffold(
          material: (
            _,
            __,
          ) =>
              myMaterialScaffoldData,
          cupertino: (
            _,
            __,
          ) =>
              myCupertinoPageScaffoldData,
          
          
          appBar: PlatformAppBar(
            backgroundColor: Colors.transparent,
            title: PlatformText(appTitle),
            material: (
              _,
              __,
            ) =>
                myMaterialAppBarData,
            cupertino: (_, __) => myCupertinoNavigationBarData,
            trailingActions: <Widget>[
              PlatformIconButton(
                padding: EdgeInsets.zero,
                icon: Icon(context.platformIcons.share),
                color: Colors.black87,
                // ignore: no-empty-block
                onPressed: () {},
              ),
            ],
          ),
          // using stack to place background image at bottom and layer content on top
          body: Stack(children: <Widget>[
            Center(
                // ignore: prefer-trailing-comma
                child: Container(
                    // have to instruct the DecoratedBox to expand to the
                    // expanded container size as we set body extended
                    constraints: const BoxConstraints.expand(),
                    // ignore: prefer-trailing-comma
                    decoration: const BoxDecoration(
                        // ignore: prefer-trailing-comma
                        image: DecorationImage(
                      image: AssetImage("images/background.jpg"),
                      fit: BoxFit.cover,
                    )))),
            Center(
                // ignore: prefer-trailing-comma
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                PlatformText("increment or decrement"),
                PlatformText(
              '$myCounter',
              
            ),

              ],
            )),
            // since  we are using a parent stack container we can fake a cross-platform non-nav-fab with
            // a positioned container that contains buttons
            // ignore: prefer-trailing-comma
            Positioned(
                bottom: 54,
                right: 34,
                // ignore: prefer-trailing-comma
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // ignore: prefer-trailing-comma
                    children: <Widget>[
                      PlatformIconButton(
                        onPressed: () {
                          _incrementCounter();
                        },
                        padding: EdgeInsets.zero,
                        icon: Icon(context.platformIcons.addCircledSolid),
                      ),
                      
                    ]))
          ]),
        ));
  }
}

  
