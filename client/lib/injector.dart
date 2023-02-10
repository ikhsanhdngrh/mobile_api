import 'package:client/domain/use_cases/create_barang_use_case.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:client/data/data_sources/remote/barang_remote_data_source.dart';
import 'package:client/data/repositories/barang_repository_impl.dart';
import 'package:client/domain/repositories/barang_repository.dart';
import 'package:client/domain/use_cases/fetch_barang_use_case.dart';
import 'package:client/domain/use_cases/delete_barang_use_case.dart';
import 'package:client/presentation/blocs/bloc/barang_bloc.dart';

/// Initialize sl as a service locator.
final sl = GetIt.instance;

/// Initialize all setup service locator.
Future<void> init() async {
  // bloc
  // registering service locator for [LecturersBloc].
  sl.registerFactory(() => BarangBloc(
      fetchBarangUseCase: sl(),
      deleteBarangUseCase: sl(),
      createBarangUseCase: sl()));

  // usecases
  // registering service locator for [FetchProductUseCase].
  sl.registerLazySingleton(() => FetchBarangUseCase(barangRepository: sl()));
  sl.registerLazySingleton(() => DeleteBarangUseCase(barangRepository: sl()));
  sl.registerLazySingleton(() => CreateBarangUseCase(barangRepository: sl()));

  // repositories
  // registering service locator for [ProductRepository].
  sl.registerLazySingleton<BarangRepository>(
      () => BarangRepositoryImpl(barangRemoteDataSource: sl()));

  // datasources
  // registering service locator for [ProductRemoteDataSource].
  sl.registerLazySingleton<BarangRemoteDataSource>(
      () => BarangRemoteDataSourceImpl(dio: sl()));

  // external
  // registering service locator for [Dio()].
  sl.registerLazySingleton(() => Dio());
}
