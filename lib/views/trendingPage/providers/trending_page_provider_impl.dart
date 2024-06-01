part of 'trending_page_provider.dart';

class TrendingPageProviderImpl extends TrendingPageProvider {
  @override
  void setGoUp({required bool value}) {
    _showGoUp = value;
    notifyListeners();
  }

  @override
  void setRegionControllerOffset({required double value}) {
    _regionControllerOffset = value;
    notifyListeners();
  }
}
