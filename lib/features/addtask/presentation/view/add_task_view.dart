import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/functions/routing.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/core/widgets/custom_elev_button.dart';
import 'package:taskati/features/addtask/data/task_model.dart';
import 'package:taskati/features/home/presentation/view/home_view.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  var titleController = TextEditingController();
  var noteController = TextEditingController();

  String date = DateFormat("dd/MM/yyy").format(DateTime.now());
  String startTime = DateFormat('hh: mm a').format(DateTime.now());
  String endTime = DateFormat("hh:mm a")
      .format(DateTime.now().add(const Duration(minutes: 40)));
  int color = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          'Add Task',
          style: getTitleStyle(fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColors.primaryColor,
            )),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title',
              style: getTitleStyle(color: AppColors.black),
            ),
            const Gap(5),
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                hintText: 'Enter title here',
              ),
            ),
            Text(
              'Note',
              style: getTitleStyle(color: AppColors.black),
            ),
            const Gap(5),
            TextFormField(
                controller: noteController,
                maxLines: 4,
                decoration: const InputDecoration(
                  hintText: 'Enter note here',
                )),
            Text(
              'Date',
              style: getTitleStyle(color: AppColors.black),
            ),
            const Gap(5),
            TextFormField(
              readOnly: true,
              onTap: () {
                showDatePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        lastDate: (DateTime(2026)))
                    .then((value) {
                  if (value != null) {
                    setState(() {
                      date = DateFormat("dd/MM/yyy").format(value);
                    });
                  }
                });
              },
              decoration: InputDecoration(
                suffixIcon: const Icon(
                  Icons.calendar_month_outlined,
                  color: AppColors.primaryColor,
                ),
                hintText: date,
              ),
            ),
            const Gap(5),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Start time',
                        style: getTitleStyle(color: AppColors.black),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'End Time',
                        style: getTitleStyle(color: AppColors.black),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        onTap: () {
                          showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now())
                              .then((value) {
                            if (value != null) {
                              setState(() {
                                startTime = value.format(context);
                              });
                            }
                          });
                        },
                        decoration: InputDecoration(
                            hintText: startTime,
                            suffixIcon: const Icon(Icons.watch_later_outlined)),
                      ),
                    ),
                    const Gap(10),
                    Expanded(
                      child: TextFormField(
                        onTap: () {
                          showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now())
                              .then((value) {
                            if (value != null) {
                              setState(() {
                                endTime = value.format(context);
                              });
                            }
                          });
                        },
                        decoration: InputDecoration(
                            hintText: endTime,
                            suffixIcon: const Icon(Icons.watch_later_outlined)),
                      ),
                    ),
                  ],
                ),
                const Gap(10),
                Row(
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Colors',
                            style: getTitleStyle(color: AppColors.black),
                          ),
                          Row(
                            children: [
                              ...List.generate(
                                  3,
                                  (index) => Padding(
                                        padding: const EdgeInsets.all(2),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              index = color;
                                            });
                                          },
                                          child: CircleAvatar(
                                              child: index == color
                                                ? const Icon(
                                                    Icons.check,
                                                    color: AppColors.white,
                                                  )
                                                : const SizedBox(),
                                            radius: 15,
                                          
                                            backgroundColor: index == 0
                                                ? AppColors.primaryColor
                                                : index == 1
                                                    ? AppColors.orangeColor
                                                    : AppColors.pinkColor,
                                          ),
                                        ),
                                      )),
                            ],
                          )
                        ]),
                    const Spacer(),
                    custom_elev_button(
                      onPressed: () {
                        String id = DateTime.now().toString();

                        AppLocalStorage.cashtaskbox(
                            id,
                            TaskModel(
                                id: id,
                                title: titleController.text,
                                note: noteController.text,
                                date: date,
                                startTime: startTime,
                                endTime: endTime,
                                color: color,
                                isComplete: false));
                        pushWithReplacement(context, const HomeView());
                      },
                      text: 'Create Task',
                      width: 120,
                      height: 50,
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
