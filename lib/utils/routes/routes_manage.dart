import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mediaplusfrontend/common/widgets/errorWidgetScreen/error_widget_screen.dart';
import 'package:mediaplusfrontend/utils/routes/routes_name.dart';
import 'package:mediaplusfrontend/views/homeScreen/screens/home_screen.dart';
import 'package:mediaplusfrontend/views/viewPage/pages/view_page.dart';

Map<String, WidgetBuilder> routes({Object? args}) => {
      RoutesName.homePage: (context) => const HomeScreen(),
      RoutesName.viewPage: (context) => ViewPage(index: args as int),
    };

Route onGenerateRoutes(RouteSettings routeSettings) {
  final builder = routes(args: routeSettings.arguments)[routeSettings.name];
  if (builder != null) {
    return MaterialPageRoute(
      builder: (context) => builder(context),
      settings: routeSettings,
    );
  } else {
    return MaterialPageRoute(builder: (context) => const ErrorWidgetScreen());
  }
}
