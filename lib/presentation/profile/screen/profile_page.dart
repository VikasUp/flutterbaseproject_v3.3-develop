import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/injection_container.dart';
import '/presentation/profile/bloc/profile.dart';
import 'profile_screen.dart';


class ProfilePage extends StatelessWidget {
  static String tag = 'profile-screen';

  const ProfilePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => BlocProvider<ProfileBloc>(
        create: (context) => serviceLocator<ProfileBloc>(),
        child: const ProfileScreen(),
      );
}
