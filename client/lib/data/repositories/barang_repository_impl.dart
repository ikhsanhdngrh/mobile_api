import 'package:client/data/data_sources/remote/barang_remote_data_source.dart';
import 'package:client/data/models/barang_model.dart';
import 'package:client/domain/repositories/barang_repository.dart';

class BarangRepositoryImpl implements BarangRepository {
  BarangRepositoryImpl({required this.barangRemoteDataSource});

  final BarangRemoteDataSource barangRemoteDataSource;

  @override
  Future<List<BarangModel>> fetch() async {
    return await barangRemoteDataSource.fetch();
  }
}
