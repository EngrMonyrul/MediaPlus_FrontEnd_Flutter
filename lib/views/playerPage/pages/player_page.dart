import 'package:fl_pip/fl_pip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mediaplusbackend/models/item/item.dart';
import 'package:mediaplusfrontend/views/playerPage/providers/player_page_provider.dart';
import 'package:pip_view/pip_view.dart';
import 'package:provider/provider.dart';
import 'package:simple_pip_mode/pip_widget.dart';
import 'package:simple_pip_mode/simple_pip.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayerPage extends StatefulWidget {
  const PlayerPage({super.key, this.item});

  final Item? item;

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  late YoutubePlayerController youtubePlayerController;

  void videoSetup() {
    // context.read<PlayerPageProvider>().setVideoLoading(value: true);
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: widget.item?.id ?? "",
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        controlsVisibleAtStart: true,
      ),
    )
      ..play()
      ..addListener(() {});
    // context.read<PlayerPageProvider>().setVideoLoading(value: false);
  }

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
    videoSetup();
    SimplePip().setAutoPipMode();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    youtubePlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        SystemChrome.setPreferredOrientations(
            [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
      },
      child: Consumer<PlayerPageProvider>(
        builder: (context, playerPageProvider, child) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.black,
              body: Center(
                child: PipWidget(
                  pipChild: YoutubePlayer(
                    controller: youtubePlayerController,
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: Colors.amber,
                    progressColors: const ProgressBarColors(
                      playedColor: Colors.amber,
                      handleColor: Colors.amberAccent,
                    ),
                  ),
                  child: YoutubePlayer(
                    controller: youtubePlayerController,
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: Colors.amber,
                    progressColors: const ProgressBarColors(
                      playedColor: Colors.amber,
                      handleColor: Colors.amberAccent,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
