abstract class Env {
  static const String clientId = String.fromEnvironment(
    'CLIENT_ID',
    defaultValue: '1c9a747601ef32d03d54067890189509',
  );
  static const String androidCallbackScheme = String.fromEnvironment(
    'ANDROID_CALLBACK_SCHEME',
    defaultValue: 'dev.getboolean.anime-character-tierlist',
  );
  static const String iosCallbackScheme = String.fromEnvironment(
    'IOS_CALLBACK_SCHEME',
    defaultValue: 'dev.getboolean.anime-character-tierlist',
  );
  static const String webCallbackScheme = String.fromEnvironment(
    'WEB_CALLBACK_SCHEME',
    defaultValue: 'dev.getboolean.anime-character-tierlist',
  );
  static const String windowsCallbackScheme = String.fromEnvironment(
    'WINDOWS_CALLBACK_SCHEME',
    defaultValue: 'dev.getboolean.anime-character-tierlist',
  );
  static const String macosCallbackScheme = String.fromEnvironment(
    'MACOS_CALLBACK_SCHEME',
    defaultValue: 'dev.getboolean.anime-character-tierlist',
  );
  static const String linuxCallbackScheme = String.fromEnvironment(
    'LINUX_CALLBACK_SCHEME',
    defaultValue: 'dev.getboolean.anime-character-tierlist',
  );
}
