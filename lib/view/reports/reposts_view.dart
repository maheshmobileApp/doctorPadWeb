import 'package:cgg_base_project/res/app_colors.dart';
import 'package:cgg_base_project/view_model/reports_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/cli_commands.dart';
import 'package:provider/provider.dart';

import '../../view_model/hospital_viewmodel.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ReportsViewModel>();
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          // Adjust the cross axis count based on screen width
          int crossAxisCount = constraints.maxWidth > 600 ? 3 : 2;

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: 2.5, // Adjust the aspect ratio as needed
            ),
            itemCount: viewModel.dashboardReports?.body == null
                ? 0
                : viewModel.dashboardReports?.body!.length,
            itemBuilder: (BuildContext context, int index) {
              final data = viewModel.dashboardReports?.body![index];
              final countItem =
                  CountItem(data?.countName ?? "", data?.totalCount ?? 0);
              return CountCard(countItem: countItem);
            },
          );
        },
      ),
    );
  }
}

class CountItem {
  final String countName;
  final int totalCount;

  CountItem(this.countName, this.totalCount);
}

class CountCard extends StatelessWidget {
  final CountItem countItem;

  CountCard({required this.countItem});

  // Define a list of gradients for each count item
  final List<Gradient> _gradients = [
    LinearGradient(
      colors: [AppColors.app_bg_color, Color.fromARGB(255, 50, 146, 197)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    // LinearGradient(
    //   colors: [Color(0xFF665E06), Color(0xFFF09819)],
    //   begin: Alignment.topLeft,
    //   end: Alignment.bottomRight,
    // ),
    // Add more gradients for each count item
  ];

  @override
  Widget build(BuildContext context) {
    final int gradientIndex = countItem.hashCode % _gradients.length;
    final Gradient selectedGradient = _gradients[gradientIndex];

    return Card(
      margin: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          gradient: selectedGradient,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                countItem.countName.capitalize(),
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                    letterSpacing: 2,
                    color: Colors.white),
              ),
              SizedBox(height: 10),
              Text(
                countItem.totalCount.toString().capitalize(),
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 25,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
