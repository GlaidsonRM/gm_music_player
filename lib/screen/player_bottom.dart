import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gm_music_player/controller/play_controller.dart';
import 'package:gm_music_player/screen/player_screen_2.dart';

class PlayerBottom extends StatelessWidget {
  final PlayController playController = Get.find();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.off(PlayerScreen2(),
          transition: Transition.downToUp,
          duration: Duration(milliseconds: 500)),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 55,
        color: Theme.of(context).primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              InkWell(
                onTap: playController.isPlaying.value
                    ? playController.pause
                    : playController.resume,
                child: Icon(
                  playController.isPlaying.value
                      ? Icons.pause
                      : Icons.play_arrow,
                  color: Colors.white,
                  size: 40,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    playController.listAllMusic.isEmpty
                        ? Text(
                            'Sem Música',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        : Text(
                            playController
                                .listAllMusic[playController.positionPlay.value]
                                .description
                                .split('-')[1]
                                .trim(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                    playController.listAllMusic.isEmpty
                        ? Text(
                            'Sem Artista',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        : Text(
                            playController
                                .listAllMusic[playController.positionPlay.value]
                                .description,
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          )
                  ],
                ),
              ),
              InkWell(
                  onTap: playController.nextPlay,
                  child: Icon(
                    Icons.favorite,
                    size: 20,
                    color: Colors.white,
                  )),
              SizedBox(
                width: 8,
              ),
              InkWell(
                  onTap: playController.nextPlay,
                  child: Icon(
                    Icons.skip_next,
                    size: 40,
                    color: Colors.white,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
