import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gm_music_player/controller/play_controller.dart';
import 'package:gm_music_player/model/music_model.dart';
import 'package:gm_music_player/screen/player_bottom.dart';
import 'package:gm_music_player/screen/player_screen.dart';
import 'package:gm_music_player/screen/player_screen_2.dart';

class HomeScreen extends StatelessWidget {
  final PlayController playController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Music Player'),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.next_plan),
              onPressed: () => Get.to(PlayerScreen2(),
                  duration: Duration(seconds: 1),
                  transition: Transition.rightToLeft))
        ],
      ),
      body: Obx(() => Column(
        children: [
          Expanded(
            child: ListView.builder(
                  itemCount: playController.listAllMusic.length,
                  itemBuilder: (context, index) {
                    MusicModel musicModel = playController.listAllMusic[index];

                    return ListTile(
                      title: Text(musicModel.description.split('-')[1].trim(), overflow: TextOverflow.ellipsis,),
                      subtitle: Text(musicModel.description.split('-')[0].trim()),
                      leading: GetUtils.isNullOrBlank(musicModel.urlImage) ?
                      Image.network('https://firebasestorage.googleapis.com/v0/b/gm-music.appspot.com/o/album_images%2FMartin%20Garrix.png?alt=media&token=7ce4bdcb-74a0-454d-a256-bd1374245287') :
                      Image.network(musicModel.urlImage),
                      trailing: Icon(Icons.menu),
                      onTap: (){
                        playController.positionPlay.value = index;
                        playController.play();
                      },
                    );
                  },
                ),
          ),
          PlayerBottom()
        ],
      )),
    );
  }
}
