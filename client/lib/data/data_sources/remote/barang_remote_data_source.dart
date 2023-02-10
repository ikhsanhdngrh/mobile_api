import 'dart:developer';

import 'package:dio/dio.dart';

import '../../models/barang_model.dart';

abstract class BarangRemoteDataSource {
  Future<bool> delete({required int id});
  Future<bool> create({required String nmBarang, required String jumlah});
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

  @override
  Future<bool> delete({required int id}) async {
    try {
      final response = await dio.delete(
          'http://localhost/server/api/databarang/delete.php',
          data: {"id": id});
      if (response.statusCode == 200 && response.data.toString().isNotEmpty) {
        return true;
      } else {
        return false;
      }
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

  Future<bool> create({required String nmBarang, required jumlah}) async {
    try {
      final response = await dio.post(
        'http://localhost/server/api/databarang/add.php',
        data: {"nmbarang": nmBarang, "jumlah": jumlah},
      );
      if (response.statusCode == 201 && response.data.toString().isNotEmpty) {
        return true;
      } else {
        return false;
      }
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
