import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:client/presentation/blocs/bloc/barang_bloc.dart';
import 'package:client/presentation/pages/main_pages.dart';

import 'injector.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Inject all dependecies injector and wait for it is done
  await di.init();
  runApp(const Barang());
}

class Barang extends StatelessWidget {
  const Barang({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl<BarangBloc>()
            ..add(
              const BarangFetchEvent(),
            ),
        ),
      ],
      child: const MaterialApp(
        home: MainPage(),
      ),
    );
  }
}
