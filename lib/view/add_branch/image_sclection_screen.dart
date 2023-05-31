import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:provider/provider.dart';

import '../../view_model/hospital_viewmodel.dart';

class ImageSclectionScreen extends StatelessWidget {
  ImageSclectionScreen({super.key});
  bool imageview = false;
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<GetAllHospitalViewModel>();
    return Column(
      children: [
        InkWell(
          onTap: () async {
            final image = await ImagePickerWeb.getImageInfo;
            // html.File? imageFile = await ImagePickerWeb.getMultiImagesAsFile();
            print("image file ${image?.fileName}");
            //print(image?.name);
            viewModel.updateTheImage(image);
          },
          child: DottedBorder(
            color: Colors.black,
            dashPattern: [5, 5],
            child: Container(
              child: viewModel.selectedImage != null
                  ? Image.memory(viewModel.selectedImage!.data!)
                  : Center(
                      child: Icon(Icons.add),
                    ),
              height: (MediaQuery.of(context).size.height * 0.2) - 20,
              width: MediaQuery.of(context).size.width * 0.2,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(4)),
            ),
          ),
        ),
      ],
    );
  }
}
