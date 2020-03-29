import 'package:flutter_test/flutter_test.dart';
import 'package:polis/model/partido_model.dart';

void main() {
  final jsonPartido = {
    'id': '1',
    'nome': 'Teste',
    'sigla': 'PT',
  };

  final partidoModel = PartidoModel(
    id: '1',
    nome: 'Teste',
    sigla: 'PT',
  );

  group('PartidoModel tests', () {
    test('props', () {
      final partido1 = PartidoModel(
        id: '1',
      );
      final partido11 = PartidoModel(
        id: '1',
      );
      final partido2 = PartidoModel(
        id: '2',
      );

      expect(partido1 == partido11, true);
      expect(partido1 == partido2, false);
    });

    test('hashCode', () {
      final partido1 = PartidoModel(
        id: '1',
      );
      final partido11 = PartidoModel(
        id: '1',
      );
      final partido2 = PartidoModel(
        id: '2',
      );

      expect(partido1.hashCode, partido11.hashCode);
      expect(partido1.hashCode == partido2.hashCode, false);
    });

    test('toString()', () {
      final modelToString = PartidoModel(id: '1').toString();
      print(modelToString);
      final result = '''PartidoModel{id: 1, sigla: null, nome: null}''';
      expect(modelToString == result, true);
    });

    test('fromJson()', () {
      expect(PartidoModel.fromJson(jsonPartido) == partidoModel, true);
    });

    test('toJson()', () {
      final partidoToJson = partidoModel.toJson();
      expect(partidoToJson['id'] == jsonPartido['id'], true);
      expect(partidoToJson['nome'] == jsonPartido['nome'], true);
      expect(partidoToJson['sigla'] == jsonPartido['sigla'], true);
    });
  });
}
