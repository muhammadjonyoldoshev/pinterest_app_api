import 'package:get/get.dart' as g;
import 'package:printerest_app/models/settings_model.dart';

class SettingsController extends g.GetxController {
  SettingsModel? settings;

  @override
  void onInit() {
    super.onInit();
    fillSettings();
  }

  void storeSettings(SettingsModel settingsModel) {
    //todo store settings which come
  }

  void fillSettings([SettingsModel? changedSettings]) {
    if (changedSettings == null) {
      //todo read settings from local db
    } else {
      settings = changedSettings;
      update();
      // todo write new settings
    }
  }
}