import 'package:flutter/cupertino.dart';

part 'player_provider_impl.dart';

abstract class PlayerPageProvider extends ChangeNotifier {
  bool _videoLoading = false;
  bool _hideController = false;
  bool _showCaption = false;
  bool _showHd = false;
  bool _loop = false;
  bool _mute = false;

  bool get videoLoading => _videoLoading;
  bool get hideController => _hideController;
  bool get showCaption => _showCaption;
  bool get showHd => _showHd;
  bool get loop => _loop;
  bool get mute => _mute;

  void setVideoLoading({required bool value});
  void setHideController({required bool value});
  void setShowCaption({required bool value});
  void setShowHd({required bool value});
  void setLoopPlay({required bool value});
  void setMute({required bool value});
}