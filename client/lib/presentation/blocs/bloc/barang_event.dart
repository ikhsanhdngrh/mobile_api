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

class BarangDeleteEvent extends BarangEvent {
  final int id;

  const BarangDeleteEvent({required this.id});

  @override
  List<Object> get props => [id];
}

class BarangCreateEvent extends BarangEvent {
  final String nmBarang;
  final String jumlah;

  const BarangCreateEvent({required this.nmBarang, required this.jumlah});

  @override
  List<Object> get props => [nmBarang, jumlah];
}
