import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/functions/routing.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/core/widgets/custom_elev_button.dart';
import 'package:taskati/features/addtask/presentation/view/add_task_view.dart';

class DateHeader extends StatelessWidget {
  const DateHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat.yMMMMd().format(DateTime.now()),
              style: getTitleStyle(
                  color: AppColors.black, fontWeight: FontWeight.w500),
            ),
            Text('Today ',
                style: getTitleStyle(
                    color: AppColors.black, fontWeight: FontWeight.w500)),
          ],
        ),
        const Spacer(),
        custom_elev_button(
          onPressed: () {
            pushto(context, const AddTask());
          },
          text: ('+Add Task'),
          width: 125,
        ),
      ],
    );
  }
}
