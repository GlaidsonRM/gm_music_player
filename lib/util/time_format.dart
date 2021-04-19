
String timeMusicFormat(Duration duration){
  int min = duration.inMinutes.remainder(60);
  int sec = duration.inSeconds.remainder(60);

  String minute = min.toString();
  String second = sec.toString();

  if(min < 10){
    minute = '0$min';
  }
  if(sec < 10){
    second = '0$sec';
  }

  return '$minute:$second';

}