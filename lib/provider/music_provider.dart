import 'package:flutter/widgets.dart';

class MusicProvider extends ChangeNotifier {
  Duration _musicPosition = const Duration();
  Duration _musicLength = const Duration();
  bool _isPlay = false;

  void changeStopStartIcon(){
    _isPlay = !_isPlay;
    notifyListeners();
  }

  void changePosition(p){
    _musicPosition = p;
    notifyListeners();
  }

  void changeMusicLength(l){
    _musicLength = l;
    notifyListeners();
  }

  get getPosition => _musicPosition;
  get getMusicLenght => _musicLength;
  get getBoolPlay => _isPlay;

  set setPosition(p) => _musicPosition = p;
  set setMusicLength(l) => _musicLength = l;
  set setBoolPlay(b) => _isPlay = b;

}