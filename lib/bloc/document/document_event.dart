import 'package:equatable/equatable.dart';

abstract class DocumentEvent extends Equatable {
  const DocumentEvent();
}

class OpenDocumentImage extends DocumentEvent {
  OpenDocumentImage(this.url);

  final String url;

  @override
  List<Object> get props => [url];
}
