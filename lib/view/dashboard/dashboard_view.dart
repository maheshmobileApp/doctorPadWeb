import 'package:cgg_base_project/view/hospital_view/hospital_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sidebarx/sidebarx.dart';

import '../../res/components/sidepanel_widgets/sidepanel_widgets.dart';

class DashBoardView extends StatelessWidget {
  const DashBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 200,
            color: Colors.red,
            child: SidepanelWidgets(),
          ),
          Expanded(child: HospitalView())
        ],
      ),
    );
  }
}
