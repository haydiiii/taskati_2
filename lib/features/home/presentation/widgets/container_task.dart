import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_style.dart';

class ContainerTask extends StatelessWidget {
  const ContainerTask({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.primaryColor),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Flutter Task -1',
                style: getBodyStyle(color: AppColors.white, fontsize: 16),
              ),
              const Gap(5),
              Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.watch_later_outlined,
                    color: AppColors.white,
                    size: 20,
                  ),
                  const Gap(5),
                  Text(
                    'data',
                    style: getSmallStyle(color: AppColors.white),
                  )
                ],
              ),
              const Gap(5),
              Text(
                'I will do this Task',
                style: getBodyStyle(color: AppColors.white, fontsize: 16),
              )
            ],
          ),
          const Spacer(),
          const SizedBox(
            height: 80,
            child: RotatedBox(
                quarterTurns: 5,
                child: Divider(
                  color: AppColors.white,
                )),
          ),
          RotatedBox(
              quarterTurns: 3,
              child: Text(
                'TODO',
                style: getBodyStyle(color: AppColors.white, fontsize: 16),
              ))
        ],
      ),
    );
  }
}
