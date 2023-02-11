import 'package:client/presentation/blocs/bloc/barang_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final nmBarangController = TextEditingController();
  final jumlahController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Page'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(hintText: 'Nama Barang'),
            ),
            const SizedBox(
              height: 10,
            ),
            const TextField(
              decoration: InputDecoration(hintText: 'Jumlah'),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  context.read<BarangBloc>().add(BarangCreateEvent(
                      nmBarang: nmBarangController.text,
                      jumlah: jumlahController.text));
                  context.read<BarangBloc>().add(const BarangFetchEvent());
                },
                child: const Text('Submit')),
          ],
        ),
      ),
    );
  }
}
