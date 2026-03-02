import 'package:w6/model/settings/app_settings.dart';

abstract class AppSettingsRepositiry {
  Future<AppSettings> load();
  Future<void> save(AppSettings settings);
}
