import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:gm_music_player/controller/play_controller.dart';
import 'package:gm_music_player/screen/home_screen.dart';
import 'package:gm_music_player/util/time_format.dart';

class PlayerScreen2 extends StatelessWidget {
  final PlayController playController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          appBar: AppBar(
            elevation: 0,
            title: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'PLAYLIST',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Loved tracks',
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
            ),
            leading: IconButton(
              icon: Icon(
                Icons.keyboard_arrow_down,
                size: 40,
                color: Colors.white,
              ),
              onPressed: () => Get.off(HomeScreen(),
                  transition: Transition.upToDown,
                  duration: Duration(milliseconds: 500)),
            ),
          ),
          body: Column(
            children: [
              Center(
                  child: GetUtils.isNullOrBlank(playController
                          .listAllMusic[playController.positionPlay.value]
                          .urlImage)
                      ? Image.asset('images/folder.png')
                      : Image.network(playController
                          .listAllMusic[playController.positionPlay.value]
                          .urlImage)),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.share_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                            onPressed: () {}),
                        PopupMenuButton<String>(
                          onSelected: (value) {},
                          itemBuilder: (context) {
                            return {'Atualizar'}.map((String choice) {
                              return PopupMenuItem<String>(
                                value: choice,
                                child: Text(choice),
                              );
                            }).toList();
                          },
                          iconSize: 30,
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                              size: 30,
                            ),
                            onPressed: () {})
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            timeMusicFormat(
                                playController.timeCurrentAudio.value),
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            timeMusicFormat(
                                playController.durationCurrentAudio.value),
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: NeumorphicSlider(
                        style: SliderStyle(
                            accent: Colors.blue, variant: Colors.green),
                        max: playController
                            .durationCurrentAudio.value.inMilliseconds
                            .toDouble(),
                        value: playController
                            .timeCurrentAudio.value.inMilliseconds
                            .toDouble(),
                        min: 0,
                        onChangeEnd: (value) {
                          playController.setTimeAudioPosition(value.toInt());
                        },
                        onChangeStart: (value) {
                          playController.setTimeAudioPosition(value.toInt());
                        },
                        onChanged: (value) {
                          playController.setTimeAudioPosition(value.toInt());
                        },
                        height: 2,
                        thumb: Icon(
                          Icons.circle,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      playController
                          .listAllMusic[playController.positionPlay.value]
                          .description
                          .split('-')[1],
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      playController
                          .listAllMusic[playController.positionPlay.value]
                          .description,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: playController.backPlay,
                          child: Icon(
                            Icons.skip_previous,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        InkWell(
                          onTap: playController.isPlaying.value
                              ? playController.pause
                              : playController.resume,
                          child: Icon(
                            playController.isPlaying.value
                                ? Icons.pause
                                : Icons.play_arrow,
                            color: Colors.white,
                            size: 60,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        InkWell(
                          onTap: playController.nextPlay,
                          child: Icon(
                            Icons.skip_next,
                            color: Colors.white,
                            size: 40,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
