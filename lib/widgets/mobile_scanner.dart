import 'package:flutter/material.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

// class MobileScannerScreen extends StatefulWidget {
//   const MobileScannerScreen({super.key});

//   @override
//   State<MobileScannerScreen> createState() => _MobileScannerScreenState();
// }

// class _MobileScannerScreenState extends State<MobileScannerScreen> with WidgetsBindingObserver {
//   final MobileScannerController controller = MobileScannerController();
//   StreamSubscription<Object?>? _subscription;

//   void _handleBarcode(BarcodeCapture barcode) {
//     print("Streamm");
//     print('Barcode data: ${barcode..image}');
//     print('Barcode type: ${barcode.barcodes.first}');
//   }

//   @override
//   void initState() {
//     WidgetsBinding.instance.addObserver(this);
//     // controller = MobileScannerController();

//     // Start listening to the barcode events.
//     _subscription = controller.barcodes.listen(_handleBarcode);

//     // Finally, start the scanner itself.
//     // unawaited(controller.start()
//     //   controller = MobileScannerController();
//     super.initState();
//   }

//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     // If the controller is not ready, do not try to start or stop it.
//     // Permission dialogs can trigger lifecycle changes before the controller is ready.
//     if (!controller.value.isInitialized) {
//       return;
//     }

//     switch (state) {
//       case AppLifecycleState.detached:
//       case AppLifecycleState.hidden:
//       case AppLifecycleState.paused:
//         return;
//       case AppLifecycleState.resumed:
//         // Restart the scanner when the app is resumed.
//         // Don't forget to resume listening to the barcode events.
//         _subscription = controller.barcodes.listen(_handleBarcode);

//         unawaited(controller.start());
//       case AppLifecycleState.inactive:
//         // Stop the scanner when the app is paused.
//         // Also stop the barcode events subscription.
//         unawaited(_subscription?.cancel());
//         _subscription = null;
//         unawaited(controller.stop());
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final scanWindow = Rect.fromCenter(
//       center: MediaQuery.sizeOf(context).center(Offset.zero),
//       width: 600,
//       height: 600,
//     );
//     return Scaffold(
//       appBar: AppBar(title: const Text('Mobile Scanner Example')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Container(
//               color: Colors.blue,
//               height: 100,
//               width: double.infinity,
//               child: MobileScanner(
//                 controller: controller,
//                 scanWindow: scanWindow,
//                 errorBuilder: (p0, p1, p2) {
//                   return Container(
//                     color: Colors.amber,
//                     child: Text('Error: $p0, $p1, $p2'),
//                   );
//                 },
//                 onDetect: (barcodes) {
//                   print("Detect");
//                   // print('Detected barcodes: $barcodes');
//                   // print('Detected barcodes: ${barcodes.barcodes.first}');
//                   // print('Detected barcodes: ${barcodes.size}');
//                   // print('Detected barcodes: $barcodes.image');
//                 },
//               ),
//             ),
//             // ..._fondoNegro(context),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // List<Widget> _fondoNegro(BuildContext context) {
// //   final size = MediaQuery.of(context).size;
// //   return [
// //     Positioned(
// //       left: 0,
// //       top: 0,
// //       child: Container(
// //         height: size.height / 3,
// //         width: size.width,
// //         color: Colors.black.withOpacity(0.75),
// //       ),
// //     ),
// //     Positioned(
// //       left: 0,
// //       bottom: 0,
// //       child: Container(
// //         height: size.height / 3,
// //         width: size.width,
// //         color: Colors.black.withOpacity(0.75),
// //       ),
// //     ),
// //     Positioned(
// //       left: 0,
// //       top: size.height / 3,
// //       child: Container(
// //         height: size.height / 3,
// //         width: 64,
// //         color: Colors.black.withOpacity(0.75),
// //       ),
// //     ),
// //     Positioned(
// //       right: 0,
// //       top: size.height / 3,
// //       child: Container(
// //         height: size.height / 3,
// //         width: 64,
// //         color: Colors.black.withOpacity(0.75),
// //       ),
// //     ),
// //     Positioned(
// //       left: 64,
// //       top: size.height / 3,
// //       child: Container(
// //         height: size.height / 3,
// //         width: size.width - 128,
// //         decoration: BoxDecoration(
// //           border: Border.all(
// //             color: Colors.white,
// //             width: 3,
// //             strokeAlign: BorderSide.strokeAlignInside,
// //           ),
// //           borderRadius: BorderRadius.circular(6),
// //         ),
// //       ),
// //     ),
// //   ];
// // }

// class BarcodeScannerWithOverlay extends StatefulWidget {
//   const BarcodeScannerWithOverlay({super.key});

//   @override
//   _BarcodeScannerWithOverlayState createState() => _BarcodeScannerWithOverlayState();
// }

// class _BarcodeScannerWithOverlayState extends State<BarcodeScannerWithOverlay> {
//   final MobileScannerController controller = MobileScannerController(
//     formats: const [BarcodeFormat.qrCode],
//   );

//   @override
//   Widget build(BuildContext context) {
//     final scanWindow = Rect.fromCenter(
//       center: MediaQuery.sizeOf(context).center(Offset.zero),
//       width: 200,
//       height: 200,
//     );

//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: const Text('Scanner with Overlay Example app'),
//       ),
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           Center(
//             child: MobileScanner(
//               fit: BoxFit.contain,
//               controller: controller,
//               scanWindow: scanWindow,
//               onDetect: (barcodes) {
//                 print('Detected barcodes: $barcodes');
//                 print('Detected barcodes: ${barcodes.barcodes.first}');
//                 print('Detected barcodes: ${barcodes.size}');
//                 // print('Detected barcodes: $barcodes.image');
//               },
//               errorBuilder: (context, error, child) {
//                 return ScannerErrorWidget(error: error);
//               },
//               overlayBuilder: (context, constraints) {
//                 return Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Align(
//                     alignment: Alignment.bottomCenter,
//                     child: ScannedBarcodeLabel(barcodes: controller.barcodes),
//                   ),
//                 );
//               },
//             ),
//           ),
//           // ValueListenableBuilder(
//           //   valueListenable: controller,
//           //   builder: (context, value, child) {
//           //     if (!value.isInitialized || !value.isRunning || value.error != null) {
//           //       return const SizedBox();
//           //     }

//           //     return CustomPaint(
//           //       painter: ScannerOverlay(scanWindow: scanWindow),
//           //     );
//           //   },
//           // ),
//           // // Align(
//           //   alignment: Alignment.bottomCenter,
//           //   child: Padding(
//           //     padding: const EdgeInsets.all(16.0),
//           //     child: Row(
//           //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           //       children: [
//           //         ToggleFlashlightButton(controller: controller),
//           //         SwitchCameraButton(controller: controller),
//           //       ],
//           //     ),
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }

//   @override
//   Future<void> dispose() async {
//     super.dispose();
//     await controller.dispose();
//   }
// }

// class ScannerOverlay extends CustomPainter {
//   const ScannerOverlay({
//     required this.scanWindow,
//     this.borderRadius = 12.0,
//   });

//   final Rect scanWindow;
//   final double borderRadius;

//   @override
//   void paint(Canvas canvas, Size size) {
//     // TODO: use `Offset.zero & size` instead of Rect.largest
//     // we need to pass the size to the custom paint widget
//     final backgroundPath = Path()..addRect(Rect.largest);

//     final cutoutPath = Path()
//       ..addRRect(
//         RRect.fromRectAndCorners(
//           scanWindow,
//           topLeft: Radius.circular(borderRadius),
//           topRight: Radius.circular(borderRadius),
//           bottomLeft: Radius.circular(borderRadius),
//           bottomRight: Radius.circular(borderRadius),
//         ),
//       );

//     final backgroundPaint = Paint()
//       ..color = Colors.black.withOpacity(0.5)
//       ..style = PaintingStyle.fill
//       ..blendMode = BlendMode.dstOut;

//     final backgroundWithCutout = Path.combine(
//       PathOperation.difference,
//       backgroundPath,
//       cutoutPath,
//     );

//     final borderPaint = Paint()
//       ..color = Colors.white
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 4.0;

//     final borderRect = RRect.fromRectAndCorners(
//       scanWindow,
//       topLeft: Radius.circular(borderRadius),
//       topRight: Radius.circular(borderRadius),
//       bottomLeft: Radius.circular(borderRadius),
//       bottomRight: Radius.circular(borderRadius),
//     );

//     // First, draw the background,
//     // with a cutout area that is a bit larger than the scan window.
//     // Finally, draw the scan window itself.
//     canvas.drawPath(backgroundWithCutout, backgroundPaint);
//     canvas.drawRRect(borderRect, borderPaint);
//   }

//   @override
//   bool shouldRepaint(ScannerOverlay oldDelegate) {
//     return scanWindow != oldDelegate.scanWindow || borderRadius != oldDelegate.borderRadius;
//   }
// }

// class ScannerErrorWidget extends StatelessWidget {
//   const ScannerErrorWidget({super.key, required this.error});

//   final MobileScannerException error;

//   @override
//   Widget build(BuildContext context) {
//     String errorMessage;

//     switch (error.errorCode) {
//       case MobileScannerErrorCode.controllerUninitialized:
//         errorMessage = 'Controller not ready.';
//       case MobileScannerErrorCode.permissionDenied:
//         errorMessage = 'Permission denied';
//       case MobileScannerErrorCode.unsupported:
//         errorMessage = 'Scanning is unsupported on this device';
//       default:
//         errorMessage = 'Generic Error';
//         break;
//     }

//     return ColoredBox(
//       color: Colors.black,
//       child: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const Padding(
//               padding: EdgeInsets.only(bottom: 16),
//               child: Icon(Icons.error, color: Colors.white),
//             ),
//             Text(
//               errorMessage,
//               style: const TextStyle(color: Colors.white),
//             ),
//             Text(
//               error.errorDetails?.message ?? '',
//               style: const TextStyle(color: Colors.white),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ScannedBarcodeLabel extends StatelessWidget {
//   const ScannedBarcodeLabel({
//     super.key,
//     required this.barcodes,
//   });

//   final Stream<BarcodeCapture> barcodes;

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: barcodes,
//       builder: (context, snapshot) {
//         final scannedBarcodes = snapshot.data?.barcodes ?? [];

//         if (scannedBarcodes.isEmpty) {
//           return const Text(
//             'Scan something!',
//             overflow: TextOverflow.fade,
//             style: TextStyle(color: Colors.white),
//           );
//         }

//         return Text(
//           scannedBarcodes.first.displayValue ?? 'No display value.',
//           overflow: TextOverflow.fade,
//           style: const TextStyle(color: Colors.white),
//         );
//       },
//     );
//   }
// }

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: QRViewExample(),
//     );
//   }
// }

class QRViewExample extends StatefulWidget {
  const QRViewExample({super.key});

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  DniData? dniData;
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (controller != null) {
      controller!.pauseCamera();
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Escanear código QR/Barcode')),
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
                overlay: QrScannerOverlayShape(
                    overlayColor: Colors.red.withOpacity(0.8),
                    borderColor: Colors.blue,
                    borderRadius: 0,
                    borderLength: 0,
                    borderWidth: 0,
                    cutOutHeight: 100,
                    cutOutWidth: double.infinity),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: (dniData != null)
                    ? Text(
                        'Código escaneado: \n${dniData!.number}\n${dniData!.gender}\n${dniData!.issueDate}\n${dniData!.processId}')
                    : const Text('Escanea un código QR o de barras'),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        print('Escaneado: ${scanData.code}');
        final DniData? dniDataParse = DniData.parseQrDniString(scanData.code ?? "");

        dniData = dniDataParse;
      });
    });
  }

  @override
  void dispose() {
    controller?.stopCamera();
    controller?.dispose();
    super.dispose();
  }
}

class DniData {
  // Propiedades
  final String number;
  final String gender;
  final String issueDate;
  final String processId;

  // Constructor con valores por defecto
  DniData({
    this.number = "",
    this.gender = "",
    this.issueDate = "",
    this.processId = "",
  });

  // Método estático para parsear el QR
  static DniData? parseQrDniString(String qrDniString) {
    try {
      List<String> splitedData = qrDniString.split('@');

      if (qrDniString[0] == '@') {
        // Doc anterior
        return DniData(
          number: splitedData[1].trim(),
          gender: splitedData[8].trim(),
          issueDate: splitedData[9].trim(),
          processId: splitedData[10].trim(),
        );
      } else {
        // Doc actual
        return DniData(
          number: splitedData[4].trim(),
          gender: splitedData[3].trim(),
          issueDate: splitedData[7].trim(),
          processId: splitedData[0].trim(),
        );
      }
    } catch (e) {
      return null;
    }
  }

  @override
  String toString() {
    return 'DniData(number: $number, gender: $gender, issueDate: $issueDate, processId: $processId)';
  }
}


//TODO: formato de DNI
// 00171798813@CISNEROS@LUIS@M@35109356@A@06/06/1990@07/03/2013

//   final dni = "00171798813@CISNEROS@LUIS@M@35109356@A@06/06/1990@07/03/2013";
//  List<String> splitedData = dni.split('@');

//   Imprimimos los datos separados
//   for (int i = 0; i < splitedData.length; i++) {
//     print('Elemento $i: ${splitedData[i]}');
//   }