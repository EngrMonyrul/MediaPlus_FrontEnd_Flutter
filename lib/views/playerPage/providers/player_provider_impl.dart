part of 'player_page_provider.dart';

class PlayerPageProviderImpl extends PlayerPageProvider {
  @override
  void setVideoLoading({required bool value}) {
    _videoLoading = true;
    notifyListeners();
  }

  @override
  void setHideController({required bool value}) {
    // TODO: implement setHideController
  }

  @override
  void setLoopPlay({required bool value}) {
    // TODO: implement setLoopPlay
  }

  @override
  void setMute({required bool value}) {
    // TODO: implement setMute
  }

  @override
  void setShowCaption({required bool value}) {
    // TODO: implement setShowCaption
  }

  @override
  void setShowHd({required bool value}) {
    // TODO: implement setShowHd
  }
}
