import 'package:client/domain/entity/barang_entity.dart';

/// Instance of class [BarangEntity] which has the role of fetching and parsing data from/to json.
class BarangModel extends BarangEntity {
  /// Fetch data from json format.
  BarangModel.fromJson(Map<String, dynamic> json)
      : super(
          id: json['id'],
          nmBarang: json['nmbarang'],
          jumlah: json['jumlah'],
        );

  /// Parse data into json format.
  Map<String, dynamic> toJson() => {
        'weather': {
          'id': id,
          'nmbarang': nmBarang,
          'jumlah': jumlah,
        },
      };
}
