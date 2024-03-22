import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/features/home/presentation/widgets/container_task.dart';
import 'package:taskati/features/home/presentation/widgets/date_header.dart';
import 'package:taskati/features/home/presentation/widgets/home_header.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const HomeHeader(),
              const SizedBox(height: 5),
              const DateHeader(),
              const SizedBox(height: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DatePicker(
                      width: 100,
                      height: 130,
                      DateTime.now(),
                      initialSelectedDate: DateTime.now(),
                      selectionColor: AppColors.primaryColor,
                      selectedTextColor: Colors.white,
                      onDateChange: (date) {
                        // New date selected
                        // setState(() {
                        //   _selectedValue = date;
                        // });
                      },
                    ),
                    const Gap(10),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 4, // Change itemCount according to your data
                        itemBuilder: (BuildContext context, int index) {
                          return const ContainerTask(); // Ensure this returns visible content
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
