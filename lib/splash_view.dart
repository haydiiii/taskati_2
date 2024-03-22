import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/constants/icon_assets.dart';
import 'package:taskati/core/functions/routing.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/features/home/presentation/view/home_view.dart';
import 'package:taskati/features/upload/upload_View.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    bool isUpload = AppLocalStorage().getCashData('isUploaded') ?? false;

    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      pushWithReplacement(
          context, isUpload ? const HomeView() : const UploadView());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(AppIcons.logoApp),
            const Gap(20),
            Text(
              ' Taskati',
              style: getTitleStyle(
                  color: AppColors.black, fontWeight: FontWeight.w400),
            ),
            const Gap(10),
            Text(
              'It\'s Time to Get Organized',
              style: getBodyStyle(color: AppColors.greyColor),
            )
          ],
        ),
      ),
    );
  }
}
