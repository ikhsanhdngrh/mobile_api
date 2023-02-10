import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:client/data/models/barang_model.dart';
import 'package:client/presentation/blocs/bloc/barang_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BarangCardWidget extends StatelessWidget {
  const BarangCardWidget({super.key, required this.barang});

  final BarangModel barang;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 5, color: Colors.transparent),
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
                image: DecorationImage(
                  image: Image.network(
                    'https://images.tokopedia.net/img/cache/500-square/VqbcmM/2022/2/26/11b36ea5-b928-40a8-b201-be6b02b0db27.jpg',
                  ).image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            barang.nmBarang,
            style: const TextStyle(fontSize: 18),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),
          Text(
            "${barang.jumlah} Pcs",
            style: const TextStyle(fontSize: 14),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          GestureDetector(
              onTap: () {
                context
                    .read<BarangBloc>()
                    .add(BarangDeleteEvent(id: barang.id));
                context.read<BarangBloc>().add(const BarangFetchEvent());
                log("Success Deleted : ${barang.id}");
              },
              child: const Icon(Icons.delete))
        ],
      ),
    );
  }
}
