import '../model/models.dart';

enum Configuracao {
  isNotificationEnabled,
  isActivityInfoEnabled,
  isDarkModeEnabled,
}

bool isConfigEnabledForUser({UserModel user, Configuracao configuracao}) {
  return user.userConfigs[configToStringKey(configuracao)] ??
      getConfigDefaultValue(configuracao);
}

bool isThemeConfig(String config) {
  return stringToConfig(config) == Configuracao.isDarkModeEnabled;
}

Configuracao stringToConfig(String configString) {
  switch (configString) {
    case 'isNotificationEnabled':
      return Configuracao.isNotificationEnabled;
    case 'isActivityInfoEnabled':
      return Configuracao.isActivityInfoEnabled;
    case 'isDarkModeEnabled':
      return Configuracao.isDarkModeEnabled;
  }
  return null;
}

String configToStringKey(Configuracao configuracao) {
  switch (configuracao) {
    case Configuracao.isNotificationEnabled:
      return 'isNotificationEnabled';
    case Configuracao.isActivityInfoEnabled:
      return 'isActivityInfoEnabled';
    case Configuracao.isDarkModeEnabled:
      return 'isDarkModeEnabled';
  }
  return null;
}

dynamic getConfigDefaultValue(Configuracao configuracao) {
  switch (configuracao) {
    case Configuracao.isNotificationEnabled:
      return true;
    case Configuracao.isActivityInfoEnabled:
      return true;
    case Configuracao.isDarkModeEnabled:
      return false;
  }
  return null;
}

dynamic getConfigValueForUser({Configuracao configuracao, UserModel user}) {
  final configString = configToStringKey(configuracao);
  final userConfigs = user.userConfigs ?? {};
  return userConfigs[configString];
}

String configToDescription(Configuracao configuracao) {
  switch (configuracao) {
    case Configuracao.isNotificationEnabled:
      return 'Habilitar notificações?';
    case Configuracao.isActivityInfoEnabled:
      return 'Habilitar visualização de suas informações?';
    case Configuracao.isDarkModeEnabled:
      return 'Usar modo escuro?';
  }
  return null;
}
