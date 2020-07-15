import '../../domain/model/acao_usuario_model.dart';
import '../../domain/model/models.dart';

abstract class ActionRepository {
  Future<void> saveUserAction({UserModel user, AcaoUsuarioModel acao});
}
