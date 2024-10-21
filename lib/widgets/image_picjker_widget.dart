import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWodget extends StatefulWidget {
  const ImagePickerWodget({super.key});

  @override
  State<ImagePickerWodget> createState() => _ImagePickerWodgetState();
}

class _ImagePickerWodgetState extends State<ImagePickerWodget> {
  @override
  Widget build(BuildContext context) {
    XFile? image;
    Future<void> pickImage() async {
      image = await ImagePicker().pickImage(
          source: ImageSource.camera, preferredCameraDevice: CameraDevice.front, maxHeight: 200, maxWidth: 200);

      print(image?.path);
      if (image == null) {
        return;
      }
      setState(() {
        image = XFile(image!.path);
      });
      print("ESTE ES EL PATH");
      print(image?.path);
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Image Picker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.orange,
              ),
              child: image == null
                  ? const Text(
                      'No image selected.',
                      style: TextStyle(fontSize: 15),
                    )
                  : Text(
                      image?.path ?? "No hay path",
                      style: const TextStyle(fontSize: 15),
                    ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: pickImage,
                child: const Text('Pick an image'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
