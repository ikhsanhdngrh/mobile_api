import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:client/presentation/blocs/bloc/barang_bloc.dart';
import 'package:client/presentation/widgets/barang_card_widget.dart';

import 'create_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Search',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: BlocBuilder<BarangBloc, BarangState>(
                  builder: (context, state) {
                    if (state is BarangFetchedState) {
                      return GridView.count(
                        scrollDirection: Axis.vertical,
                        childAspectRatio:
                            (MediaQuery.of(context).size.height / 2) /
                                (MediaQuery.of(context).size.width / 2 * 2),
                        crossAxisCount: 3,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                        physics: const AlwaysScrollableScrollPhysics(),
                        children: state.listBarang
                            .map((barang) => BarangCardWidget(barang: barang))
                            .toList(),
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CreatePage(),
              ));
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
