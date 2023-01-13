import 'package:client/data/models/barang_model.dart';

abstract class BarangRepository {
  Future<List<BarangModel>> fetch();
}
