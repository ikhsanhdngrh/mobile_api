part of 'barang_bloc.dart';

/// Abstract class to accommodate Lecturers event conditions.
abstract class BarangEvent extends Equatable {
  const BarangEvent();

  @override
  List<Object> get props => [];
}

/// Event when [BarangEvent] detects a change in city name.
class BarangFetchEvent extends BarangEvent {
  const BarangFetchEvent();

  @override
  List<Object> get props => [];
}
