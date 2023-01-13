import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:client/data/models/barang_model.dart';
import 'package:client/domain/use_cases/fetch_barang_use_case.dart';
import 'package:stream_transform/stream_transform.dart';

part 'barang_event.dart';
part 'barang_state.dart';

/// Duration of time that used for [debounce] process.
const _duration = Duration(milliseconds: 300);

/// [debounce] used to handle event changes with a certain duration.
EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class BarangBloc extends Bloc<BarangEvent, BarangState> {
  BarangBloc({required this.fetchBarangUseCase}) : super(BarangInitialState()) {
    on<BarangFetchEvent>(_fetch, transformer: debounce(_duration));
  }

  final FetchBarangUseCase fetchBarangUseCase;

  /// This method is used as a listener fetch event.
  ///
  /// Return [BarangFetchEvent] with [List<LecturersModel>] data.
  /// Throw a [BarangErrorState] along with the error message, if there is an error while retrieving list Lecturers data.
  void _fetch(BarangFetchEvent event, Emitter<BarangState> emit) async {
    emit(BarangLoadingState());
    try {
      final listBarang = await fetchBarangUseCase.call();
      emit(BarangFetchedState(listBarang: listBarang));
    } catch (error) {
      emit(BarangErrorState(message: error.toString()));
    }
  }
}
