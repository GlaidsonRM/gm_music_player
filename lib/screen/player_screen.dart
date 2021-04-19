import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:gm_music_player/controller/play_controller.dart';
import 'package:gm_music_player/util/time_format.dart';

class PlayerScreen extends StatelessWidget {
  final PlayController playController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      backgroundColor: Color(0xFF32373D),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF32373D),
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipOval(
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                color: Color(0xFF26292E),
                elevation: 12,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Icon(
                      Icons.arrow_back_outlined,
                      color: Color(0xFF66686D),
                    ),
                  ),
                ),
              ),
            ),
            Text('PLAYING NOW', style: TextStyle(
              fontFamily: 'Tahoma',
              fontWeight: FontWeight.bold,
              color: Color(0xFF6F7376),
            ),),
            ClipOval(
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                color: Color(0xFF26292E),
                elevation: 12,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Icon(
                      Icons.menu,
                      color: Color(0xFF66686D),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: ClipOval(
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)
                  ),
                  elevation: 12,
                  child: ClipOval(child: FlutterLogo(size: 200,)),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Text(playController.listAllMusic[
              playController.positionPlay.value
            ].description.split('-')[1], style: TextStyle(
              fontFamily: 'Tahoma',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF9FA1A3),
            ),),
            Text(playController.listAllMusic[
            playController.positionPlay.value
            ].description.split('-')[0], style: TextStyle(
              fontFamily: 'Tahoma',
              fontSize: 18,
              color: Color(0xFF535659),
            ),),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(timeMusicFormat(playController.timeCurrentAudio.value), style: TextStyle(
                  fontFamily: 'Tahoma',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF9FA1A3),
                ),),
                Text(timeMusicFormat(playController.durationCurrentAudio.value), style: TextStyle(
                  fontFamily: 'Tahoma',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF9FA1A3),
                ),)
              ],
            ),
            SizedBox(height: 8,),
            NeumorphicSlider(
              max: playController.durationCurrentAudio.value.inMilliseconds.toDouble(),
              value: playController.timeCurrentAudio.value.inMilliseconds.toDouble(),
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
              height: 10,
              style: SliderStyle(
                variant: Color(0xFFE33E13),
                accent: Color(0xFFE9560C),
                lightSource: LightSource.left,

              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipOval(
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50
                        )
                    ),
                    color: Color(0xFF282C30),
                    elevation: 12,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Icon(
                          Icons.fast_rewind,
                          size: 40,
                          color: Color(0xFF66686D),
                        ),
                      ),
                    ),
                  ),
                ),
                ClipOval(
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60
                        )
                    ),
                    color: Color(0xFFE33E13),
                    elevation: 12,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Icon(
                          Icons.play_arrow,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                ClipOval(
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50
                        )
                    ),
                    color: Color(0xFF282C30),
                    elevation: 12,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Icon(
                          Icons.fast_forward,
                          size: 40,
                          color: Color(0xFF66686D),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
