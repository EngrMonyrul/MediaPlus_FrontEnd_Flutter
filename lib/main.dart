import 'package:flutter/material.dart';
import 'package:mediaplusbackend/mediaplusbackend.dart';
import 'package:mediaplusfrontend/utils/routes/routes_manage.dart';
import 'package:mediaplusfrontend/utils/theme/base_theme_config.dart';
import 'package:mediaplusfrontend/views/homeScreen/screens/home_screen.dart';
import 'package:mediaplusfrontend/views/trendingPage/pages/treding_page.dart';
import 'package:mediaplusfrontend/views/trendingPage/providers/trending_page_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initPackages(
    baseUrl: "https://www.googleapis.com/youtube/v3/",
    apiKey: "AIzaSyB8gEtJif75ZNNm7hlH--JgBd6YFRSDw_k",
  );
  runApp(
    MyApp(
      title: "MediaPlus",
      provider: [
        ChangeNotifierProvider<TrendingPageProvider>(
          create: (_) => TrendingPageProviderImpl(),
        ),
      ],
      lightTheme: BaseThemeConfig.lightThemeData,
      darkTheme: BaseThemeConfig.darkThemeData,
      themeMode: ThemeMode.system,
      onGenerateRoute: onGenerateRoutes,
      home: const TrendingPage(),
    ),
  );
}
