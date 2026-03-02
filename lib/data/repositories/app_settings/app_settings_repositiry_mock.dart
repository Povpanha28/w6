import 'package:w6/data/repositories/app_settings/app_settings_repositiry.dart';
import 'package:w6/model/settings/app_settings.dart';

class AppSettingsRepositoryMock implements AppSettingsRepositiry {
  AppSettings appSettings = AppSettings(themeColor: ThemeColor.blue);

  @override
  Future<AppSettings> load() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return appSettings;
  }

  @override
  Future<void> save(AppSettings settings) async {
    await Future.delayed(const Duration(milliseconds: 300));
    appSettings = settings;
  }
}
