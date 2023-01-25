import 'dart:developer';

import 'package:dio/dio.dart';

import '../../models/barang_model.dart';

abstract class BarangRemoteDataSource {
  Future<List<BarangModel>> fetch();
}

class BarangRemoteDataSourceImpl implements BarangRemoteDataSource {
  BarangRemoteDataSourceImpl({required this.dio});

  final Dio dio;

  @override
  Future<List<BarangModel>> fetch() async {
    try {
      List<BarangModel> listBarang = [];
      final response =
          await dio.get('http://localhost/server/api/databarang/fetch.php');

      for (var data in response.data['data']) {
        BarangModel barang = BarangModel.fromJson(data);
        listBarang.add(barang);
      }
      log('listBarang:$listBarang');
      return listBarang;
    } on DioError catch (e) {
      throw (DioError(
        requestOptions: e.requestOptions,
        response: e.response,
        type: e.type,
        error: e.error,
      ));
    } on Exception catch (e) {
      throw e.toString();
    }
  }
}
