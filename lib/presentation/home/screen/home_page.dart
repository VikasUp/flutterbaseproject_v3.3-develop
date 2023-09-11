import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/injection_container.dart';
import '../bloc/home.dart';

class HomePage extends StatelessWidget {
  static String tag = '/home-screen';

  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => BlocProvider<HomeBloc>(
        create: (context) => serviceLocator<HomeBloc>(),
        child: const HomeScreen(),
      );
}
