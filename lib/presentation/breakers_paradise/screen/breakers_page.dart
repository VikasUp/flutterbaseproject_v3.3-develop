import 'package:base_project/presentation/breakers_paradise/bloc/breakers_bloc.dart';
import 'package:base_project/presentation/breakers_paradise/screen/breakers_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/injection_container.dart';

class BreakersPage extends StatelessWidget {
  static String tag = 'task screen';

  const BreakersPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => BlocProvider<BreakersBloc>(
        create: (context) => serviceLocator<BreakersBloc>(),
        child: BreakersScreen(),
      );
}
