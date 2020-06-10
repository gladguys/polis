import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'resultados_ranking_model.g.dart';

@JsonSerializable()
class ResultadosRankingModel extends Equatable {
  ResultadosRankingModel({
    this.nomesPoliticoPrimeiro,
    this.nomePoliticoUltimo,
    this.fotosPoliticoPrimeiro,
    this.fotoPoliticoUltimo,
    this.partidosPoliticoPrimeiro,
    this.partidoPoliticoUltimo,
    this.estadosPoliticoPrimeiro,
    this.estadoPoliticoUltimo,
    this.logosPartidoPoliticoPrimeiro,
    this.logoPartidoPoliticoUltimo,
    this.despesasPoliticoPrimeiro,
    this.despesaPoliticoUltimo,
    this.despesaMedia,
  });

  final String nomePoliticoUltimo;
  final String fotoPoliticoUltimo;
  final String partidoPoliticoUltimo;
  final String estadoPoliticoUltimo;
  final String logoPartidoPoliticoUltimo;
  final double despesaPoliticoUltimo;
  final double despesaMedia;
  final List<String> nomesPoliticoPrimeiro;
  final List<String> fotosPoliticoPrimeiro;
  final List<String> partidosPoliticoPrimeiro;
  final List<String> estadosPoliticoPrimeiro;
  final List<String> logosPartidoPoliticoPrimeiro;
  final List<double> despesasPoliticoPrimeiro;

  factory ResultadosRankingModel.fromJson(Map<String, dynamic> json) =>
      _$ResultadosRankingModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResultadosRankingModelToJson(this);

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return '''ResultadosRankingModel{nomePoliticoUltimo: $nomePoliticoUltimo, fotoPoliticoUltimo: $fotoPoliticoUltimo, partidoPoliticoUltimo: $partidoPoliticoUltimo, estadoPoliticoUltimo: $estadoPoliticoUltimo, logoPartidoPoliticoUltimo: $logoPartidoPoliticoUltimo, despesaPoliticoUltimo: $despesaPoliticoUltimo, despesaMedia: $despesaMedia, nomesPoliticoPrimeiro: $nomesPoliticoPrimeiro, fotosPoliticoPrimeiro: $fotosPoliticoPrimeiro, partidosPoliticoPrimeiro: $partidosPoliticoPrimeiro, estadosPoliticoPrimeiro: $estadosPoliticoPrimeiro, logosPartidoPoliticoPrimeiro: $logosPartidoPoliticoPrimeiro, despesasPoliticoPrimeiro: $despesasPoliticoPrimeiro}''';
  }
}
