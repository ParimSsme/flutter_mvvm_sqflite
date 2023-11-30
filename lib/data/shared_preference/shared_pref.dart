import 'package:shared_preferences/shared_preferences.dart';

class SharedPref{

  static const folderPathPrefKey = "folderPath";

  setFolderPath(String value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(folderPathPrefKey, value);
  }

  getFolderPath() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(folderPathPrefKey) ?? '';
  }

}