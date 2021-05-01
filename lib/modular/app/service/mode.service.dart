import 'package:news_app/data/providers/toogle.mode.dart';

class ModeService {
  final ModeProvider modeProvider;

  ModeService(this.modeProvider);
  bool getBool(String key) {
    return modeProvider.getBool(key);
  }

  Future<bool> putBool(String key, dynamic value) {
    return modeProvider.putBool(key, value);
  }
}
