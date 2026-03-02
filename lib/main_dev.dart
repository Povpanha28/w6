import 'package:provider/provider.dart';
import 'package:nested/nested.dart';
import 'package:w6/data/repositories/app_settings/app_settings_repositiry_mock.dart';

import 'main_common.dart';
import 'data/repositories/songs/song_repository.dart';
import 'data/repositories/songs/song_repository_mock.dart';
import 'ui/states/player_state.dart';
import 'ui/states/settings_state.dart';

/// Configure provider dependencies for dev environment
List<SingleChildWidget> get devProviders {
  AppSettingsRepositoryMock appSettingsRepositoryMock =
      AppSettingsRepositoryMock();
  return [
    // 1 - Inject the song repository
    Provider<SongRepository>(create: (_) => SongRepositoryMock()),

    // 2 - Inject the player state
    ChangeNotifierProvider<PlayerState>(create: (_) => PlayerState()),

    // 3 - Inject the  app setting state
    ChangeNotifierProvider<AppSettingsState>(
      create: (_) =>
          AppSettingsState(reposityMock: appSettingsRepositoryMock)..init(),// Auto load settings
    ),
  ];
}

void main() {
  mainCommon(devProviders);
}
