import 'package:freezed_annotation/freezed_annotation.dart';

part 'document_state.freezed.dart';

@freezed
abstract class DocumentState with _$DocumentState {
  factory DocumentState.initial() = InitialDocumentState;
  factory DocumentState.launchUrlFailed() = LaunchUrlFailed;
}
