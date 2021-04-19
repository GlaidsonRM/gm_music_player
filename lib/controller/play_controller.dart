import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:assets_audio_player_web/web/assets_audio_player_web.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:gm_music_player/model/music_model.dart';

class PlayController extends GetxController {
  AudioPlayer audioPlayer = AudioPlayer();
  final assetsAudioPlayer = AssetsAudioPlayer();

  var listAllMusic = [].obs;
  var positionPlay = 0.obs;
  var durationCurrentAudio = Duration(milliseconds: 1).obs;
  var timeCurrentAudio = Duration(milliseconds: 0).obs;
  var isPlaying = false.obs;

  @override
  void onInit() async {

    try {
      await assetsAudioPlayer.open(
        Audio.network("http://www.mysite.com/myMp3file.mp3"),
      );
    } catch (t) {
      //mp3 unreachable
    }

    // audioPlayer.onDurationChanged.listen((event) async {
    //   durationCurrentAudio.value = event;
    //   var dur = await audioPlayer.getDuration();
    //   print(dur);
    // });
    // audioPlayer.onAudioPositionChanged.listen((event) {
    //   timeCurrentAudio.value = event;
    // });
    //
    // audioPlayer.onSeekComplete.listen((event) {
    //   print('complete');
    // });
    //
    // audioPlayer.onPlayerCompletion.listen(
    //   (event) {
    //     nextPlay();
    //   },
    // );
    //
    // FirebaseFirestore.instance
    //     .collection('all_music')
    //     .snapshots()
    //     .listen((event) {
    //   if (event.docs.isNotEmpty) {
    //     listAllMusic.clear();
    //
    //     event.docs.forEach((element) {
    //       MusicModel musicModel = MusicModel.fromJson(element.data());
    //       musicModel.isLoading = false;
    //       musicModel.isPlaying = false;
    //       listAllMusic.add(musicModel);
    //     });
    //
    //     listAllMusic.sort((a, b) => a.description.compareTo(b.description));
    //   }
    // });

    super.onInit();
  }

  play() async {
    audioPlayer.stop();
    isPlaying.value = false;
    timeCurrentAudio.value = Duration(milliseconds: 0);
    durationCurrentAudio.value = Duration(milliseconds: 1);
    listAllMusic[positionPlay.value].isLoading = true;
    listAllMusic.refresh();
    int result = await audioPlayer.play(listAllMusic[positionPlay.value].url);
    listAllMusic.forEach((element) {
      element.isPlaying = false;
    });
    listAllMusic[positionPlay.value].isLoading = false;
    if (result == 1) {
      listAllMusic[positionPlay.value].isPlaying = true;
      isPlaying.value = true;
    }
    listAllMusic.refresh();
  }

  stop() async {
    listAllMusic.forEach((element) {
      element.isPlaying = false;
    });
    int result = await audioPlayer.stop();
    if (result == 1) {
      // success
    }
    listAllMusic.refresh();
  }

  pause() async {
    listAllMusic.forEach((element) {
      element.isPlaying = false;
    });
    int result = await audioPlayer.pause();
    if (result == 1) {
      isPlaying.value = false;
    }
    listAllMusic.refresh();
  }

  resume() async {
    listAllMusic.forEach((element) {
      element.isPlaying = false;
    });
    if(audioPlayer.state == null){
      play();
    }
    else {
      if(audioPlayer.state == AudioPlayerState.PAUSED){
        audioPlayer.resume();
        isPlaying.value = true;
      }
      else if(audioPlayer.state == AudioPlayerState.STOPPED){
        play();
      } else {
        play();
      }
      listAllMusic.refresh();
    }
  }

  void nextPlay() {
    if (positionPlay.value >= listAllMusic.length) {
      positionPlay.value = 0;
    } else {
      positionPlay.value++;
    }
    play();
  }

  void backPlay() {
    if (positionPlay.value == 0) {
      positionPlay.value = listAllMusic.length - 1;
    } else {
      positionPlay.value--;
    }
    play();
  }

  void setTimeAudioPosition(int value) {
    audioPlayer.seek(Duration(milliseconds: value));
  }
}
