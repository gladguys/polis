import 'package:equatable/equatable.dart';

abstract class DespesaImageState extends Equatable {
  const DespesaImageState();
}

class InitialDespesaImageState extends DespesaImageState {
  @override
  List<Object> get props => [];
}

class LaunchUrlFailed extends DespesaImageState {
  @override
  List<Object> get props => [];
}
