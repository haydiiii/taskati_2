import 'dart:io';

import 'package:flutter/material.dart';
import 'package:taskati/core/constants/iamge_assets.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/utils/text_style.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  @override
  Widget build(BuildContext context) {
    String? path = AppLocalStorage().getCashData('Image');
    String? name = AppLocalStorage().getCashData('name');

    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello ,$name',
              style: getTitleStyle(),
            ),
            Text(
              'Have a Nice Day ',
              style: getBodyStyle(),
            )
          ],
        ),
        const Spacer(),
        CircleAvatar(
          radius: 20,
          backgroundImage: path != null
              ? FileImage(File(path)) as ImageProvider
              : AssetImage(ImagesAssets.image1),
        )
      ],
    );
  }
}
