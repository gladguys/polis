import '../model/models.dart';

enum Configuracao {
  isNotificationEnabled,
  isActivityInfoEnabled,
  isDarkModeEnabled,
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

String getConfigValueForUser({Configuracao configuracao, UserModel user}) {
  final configString = configToStringKey(configuracao);
  final userConfigs = user.userConfigs ?? {};
  return userConfigs[configString];
}

String stringToConfigDescription(String configString) {
  switch (configString) {
    case 'isNotificationEnabled':
      return 'Habilitar notificações?';
    case 'isActivityInfoEnabled':
      return 'Habilitar visualização de suas informações?';
    case 'isDarkModeEnabled':
      return 'Usar modo escuro?';
  }
  return null;
}
