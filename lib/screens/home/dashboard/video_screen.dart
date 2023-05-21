import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:netflix/constants/app_colors.dart';
import 'package:netflix/constants/app_indicators.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({required this.url, Key? key}) : super(key: key);
  final String url;

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController videoPlayerController;
  bool isPlaying = true;

  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.network(
        "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4");
    videoPlayerController.setLooping(true);
    videoPlayerController.initialize().then((value) => setState(() {}));
    videoPlayerController.play();

    setLandscape();
  }

  Future setLandscape() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  Future setAllOrientationToDefault() async {
    await SystemChrome.setPreferredOrientations(DeviceOrientation.values);
  }

  togglePlay() => setState(() {
        if (isPlaying) {
          videoPlayerController.pause();
        } else {
          videoPlayerController.play();
        }
        isPlaying = !isPlaying;
      });

  @override
  void dispose() async {
    videoPlayerController.dispose();
    setAllOrientationToDefault();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBlackColor,
      body: videoPlayerController.value.isInitialized == false
          ? AppIndicators.circularIndicator
          : InkWell(
              onTap: togglePlay,
              child: Stack(
                children: [
                  VideoPlayer(
                    videoPlayerController,
                  ),
                  !isPlaying
                      ? Positioned(
                          top: Get.height / 2 - 20,
                          left: Get.width / 2 - 20,
                          child: CircleAvatar(
                            backgroundColor:
                                AppColors.kWhiteColor.withOpacity(.6),
                            radius: 20,
                            child: const Center(
                              child: Icon(
                                Icons.play_arrow,
                                color: AppColors.kBlackColor,
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
    );
  }
}
