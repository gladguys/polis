import 'package:equatable/equatable.dart';

abstract class DespesaImageEvent extends Equatable {
  const DespesaImageEvent();
}

class OpenDespesaImage extends DespesaImageEvent {
  OpenDespesaImage(this.url);

  final String url;

  @override
  List<Object> get props => [url];
}
