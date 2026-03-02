import 'package:flutter/widgets.dart';
import 'package:w6/data/repositories/app_settings/app_settings_repositiry_mock.dart';

import '../../model/settings/app_settings.dart';

class AppSettingsState extends ChangeNotifier {
  AppSettings? _appSettings;
  AppSettingsRepositoryMock repositoryMock;

  AppSettingsState({required AppSettingsRepositoryMock reposityMock})
    : repositoryMock = reposityMock;

  Future<void> init() async {
    // Might be used to load data from repository
    _appSettings = await repositoryMock.load();
    notifyListeners();
  }

  ThemeColor get theme => _appSettings?.themeColor ?? ThemeColor.blue;

  Future<void> changeTheme(ThemeColor themeColor) async {
    if (_appSettings == null) return;
    _appSettings = _appSettings!.copyWith(themeColor: themeColor);

    await repositoryMock.save(_appSettings!);
    notifyListeners();
  }
}
