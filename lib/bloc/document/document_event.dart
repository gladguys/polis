import 'package:freezed_annotation/freezed_annotation.dart';

part 'document_event.freezed.dart';

@freezed
abstract class DocumentEvent with _$DocumentEvent {
  factory DocumentEvent.openDocumentImage(String url) = OpenDocumentImage;
}
