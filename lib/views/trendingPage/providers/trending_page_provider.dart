import 'package:flutter/cupertino.dart';

part 'trending_page_provider_impl.dart';

abstract class TrendingPageProvider extends ChangeNotifier {
  /*-------------------> variables <-------------------*/
  bool _showGoUp = false;
  double _regionControllerOffset = 0;

  /*-------------------> getter <-------------------*/
  bool get showGoUp => _showGoUp;

  double get regionControllerOffset => _regionControllerOffset;

  /*-------------------> setter <-------------------*/
  void setGoUp({required bool value});

  void setRegionControllerOffset({required double value});
}
