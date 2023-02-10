part of 'barang_bloc.dart';

abstract class BarangState extends Equatable {
  const BarangState();

  @override
  List<Object?> get props => [];
}

/// The state where [BarangState] has fetched [List<LecturersModel>].
class BarangFetchedState extends BarangState {
  const BarangFetchedState({required this.listBarang});

  final List<BarangModel> listBarang;

  @override
  List<Object?> get props => [listBarang];
}

/// The state where [BarangState] is initializing the state.
class BarangInitialState extends BarangState {}

/// The state where [BarangState] is loading data.
class BarangLoadingState extends BarangState {}

/// The state where [BarangState] has loaded [BarangModel].
class BarangLoadedState extends BarangState {
  const BarangLoadedState({this.barang});

  final BarangModel? barang;

  @override
  List<Object> get props => [barang!];
}

/// The state where [BarangState] has an error including and error message.
class BarangErrorState extends BarangState {
  const BarangErrorState({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}

class BarangDeletedState extends BarangState {
  const BarangDeletedState({required this.result});

  final bool result;

  @override
  List<Object?> get props => [result];
}

class BarangCreatedState extends BarangState {
  const BarangCreatedState({required this.result});

  final bool result;

  @override
  List<Object?> get props => [result];
}
