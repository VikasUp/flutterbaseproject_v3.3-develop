import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppVersionText extends StatelessWidget {
  const AppVersionText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => FutureBuilder<PackageInfo>(
        future: PackageInfo.fromPlatform(),
        builder: (BuildContext context, AsyncSnapshot<PackageInfo> snapshot) {
          if (snapshot.hasData) {
            return Text(
              '${snapshot.data!.version} (${snapshot.data!.buildNumber})',
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: Colors.grey),
            );
          }
          return const SizedBox();
        },
      );
}
