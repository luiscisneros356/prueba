import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;

class SelfieCameraScreen extends StatefulWidget {
  const SelfieCameraScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SelfieCameraScreenState createState() => _SelfieCameraScreenState();
}

class _SelfieCameraScreenState extends State<SelfieCameraScreen> {
  CameraController? _cameraController;
  late List<CameraDescription> _cameras;
  bool _isCameraInitialized = false;
  String? _selfiePath;

  File prueba = File('assets/images/imagen.jpg');

  @override
  void initState() {
    _initializeCamera();
    // Image prueba2 = Image.file(prueba);
    print("prueba: $prueba");
    final p = prueba.readAsBytesSync();
    final a = base64Encode(p);

    super.initState();
  }

  Future<void> _initializeCamera() async {
    _cameras = await availableCameras();

    final frontCamera =
        _cameras.firstWhere((camera) => camera.lensDirection == CameraLensDirection.front);

    _cameraController = CameraController(
      frontCamera,
      ResolutionPreset.high,
    );

    await _cameraController!.initialize();

    setState(() {
      _isCameraInitialized = true;
    });
  }

  Future<void> _takeSelfie() async {
    if (!_cameraController!.value.isInitialized) {
      return;
    }

    // Captura la selfie
    final image = await _cameraController!.takePicture();

    await Prueba.invoke(image);

    // setState(() {
    //   _selfiePath = image.path;
    // });
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.8),
      appBar: AppBar(
        title: const Text('Selfie Camera'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_isCameraInitialized)
            Center(
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.red, width: 2), color: Colors.transparent),
                child: CameraPreview(
                  _cameraController!,
                ),
              ),
            )
          else
            const Center(
              child: CircularProgressIndicator(),
            ),
          if (_selfiePath != null)
            Image.file(
              File(_selfiePath!),
              width: 200,
              height: 200,
            ),
          // if (_selfiePath != null) Text(_selfiePath!),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _takeSelfie,
              child: const Icon(Icons.circle),
            ),
          ),
        ],
      ),
    );
  }
}

class Prueba {
  static Future<String> invoke(XFile selfie) async {
    final Uint8List imageBytes = await selfie.readAsBytes();
    img.Image? image = img.decodeImage(imageBytes);

    if (image == null) {
      throw Exception("No se pudo decodificar la imagen.");
    }
    const int newWidth = 500;
    final double factor = newWidth / image.width.toDouble();
    final int newHeight = (image.height * factor).toInt();

    img.Image resizedImage = img.copyResize(image, width: newWidth, height: newHeight);

    final resizedImageBytes = Uint8List.fromList(img.encodeJpg(resizedImage));

    return base64Encode(resizedImageBytes);
  }
}
