part of 'document_cubit.dart';

abstract class DocumentState extends Equatable {
  const DocumentState();
}

class InitialDocumentState extends DocumentState {
  @override
  List<Object> get props => [];
}

class LaunchUrlFailed extends DocumentState {
  @override
  List<Object> get props => [];
}
