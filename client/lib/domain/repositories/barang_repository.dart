import 'package:client/data/models/barang_model.dart';

abstract class BarangRepository {
  Future<bool> delete({required int id});
  Future<List<BarangModel>> fetch();

  Future<bool> create({required String nmBarang, required String jumlah});
}
