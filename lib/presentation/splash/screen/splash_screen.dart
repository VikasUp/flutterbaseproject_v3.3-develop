import 'package:base_project/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static String tag = 'splash-screen';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.images.placeholderImage.path)),
          ),

          /// If your splash screen has solid color background with logo in center
          /// use below code to create that view or get a static splash screen image
          /*child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'SFL Flutter Base Project',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            )
          ],
        ),*/
        ),
      );
}
