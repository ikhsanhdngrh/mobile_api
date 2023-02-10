import 'package:client/domain/repositories/barang_repository.dart';

class DeleteBarangUseCase {
  DeleteBarangUseCase({required this.barangRepository});

  final BarangRepository barangRepository;

  Future<bool> call({required int id}) async {
    return await barangRepository.delete(id: id);
  }
}
