import 'package:client/data/models/barang_model.dart';
import 'package:client/domain/repositories/barang_repository.dart';

class FetchBarangUseCase {
  FetchBarangUseCase({required this.barangRepository});

  final BarangRepository barangRepository;

  Future<List<BarangModel>> call() async {
    return await barangRepository.fetch();
  }
}
