import 'package:base_project/gen/assets.gen.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/index.dart';
import '/presentation/profile/bloc/profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ProfileBloc _bloc;

  int pageIndex = 0;

  List<Widget> pageList = <Widget>[
    _FirstPage(),
    _SecondPage(),
    _ThirdPage(),
  ];

  @override
  void initState() {
    _bloc = BlocProvider.of<ProfileBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.close();
  }

  @override
  Widget build(BuildContext context) => buildScaffold(context);

  Widget buildScaffold(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Profile"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: PageTransitionSwitcher(
          transitionBuilder: (Widget child, Animation<double> animation,
                  Animation<double> secondaryAnimation) =>
              FadeThroughTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          ),
          child: pageList[pageIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: pageIndex,
          onTap: (int newValue) {
            setState(() {
              pageIndex = newValue;
            });
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.photo),
              label: "Photo",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.photo_album),
              label: "Album",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.video_library),
              label: "Video",
            ),
          ],
        ),
      );

  Widget buildList(BuildContext context) =>
      BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {},
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileStateLoading) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const CircularProgressIndicator(),
                  SizedBox(height: SizeConfig.getScaledValue(10.0, context)),
                ],
              );
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const <Widget>[
                Text(
                  'loading . . ',
                  style: TextStyle(color: Colors.black38, fontSize: 16.0),
                ),
              ],
            );
          },
        ),
      );
}

class _ExampleCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Expanded(
        child: Card(
          child: Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      color: Colors.black26,
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child:  Assets.images.placeholderImage.image(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '123 photos',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        Text(
                          '123 photos',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              InkWell(
                splashColor: Colors.black38,
                onTap: () {},
              ),
            ],
          ),
        ),
      );
}

class _FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _ExampleCard(),
                _ExampleCard(),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _ExampleCard(),
                _ExampleCard(),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _ExampleCard(),
                _ExampleCard(),
              ],
            ),
          ),
        ],
      );
}

class _SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          _ExampleCard(),
          _ExampleCard(),
        ],
      );
}

class _ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ListView.separated(
        separatorBuilder: (context, index) => const Divider(
          color: Colors.black,
        ),
        itemBuilder: (BuildContext context, int index) => ListTile(
          leading: Assets.images.avatarLogo.image(
            width: 40,
          ),
          title: Text('List item ${index + 1}'),
          subtitle: const Text('Secondary text'),
        ),
        itemCount: 10,
      );
}
