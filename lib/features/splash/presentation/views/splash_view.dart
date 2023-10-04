import 'package:flutter/material.dart';
import 'package:flutter_itargs_challange/features/splash/presentation/views/widgets/splash_view_body.dart';

import '../../../../core/utils/size_config.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // Or this way => SizeConfig().init(AppRouter.navigatorKey.currentContext!);
    return const SafeArea(
      child: Scaffold(
        body: SplashViewBody(),
      ),
    );
  }
}
