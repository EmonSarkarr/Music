String formateTime(Duration duration){
  String twoDigit(int n)=>n.toString().padLeft(2,'0');
  final hours = twoDigit(duration.inHours);
  final minutes = twoDigit((duration.inMinutes.remainder(60)));
  final seconds = twoDigit(duration.inSeconds.remainder(60));
  return[
    if(duration.inHours > 0) hours,minutes,seconds,

  ].join(':');

}