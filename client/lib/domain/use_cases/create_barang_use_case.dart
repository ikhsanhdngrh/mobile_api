import 'package:client/domain/repositories/barang_repository.dart';

class CreateBarangUseCase {
  CreateBarangUseCase({required this.barangRepository});

  final BarangRepository barangRepository;

  Future<bool> call({required String nmBarang, required String jumlah}) async {
    return await barangRepository.create(nmBarang: nmBarang, jumlah: jumlah);
  }
}
