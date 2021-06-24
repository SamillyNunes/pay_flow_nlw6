import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payflow_nlw6/modules/barcode_scanner/barcode_scanner_status.dart';

class BarCodeScannerController {
  final statusNotifer =
      ValueNotifier<BarCodeScannerStatus>(BarCodeScannerStatus());
  BarCodeScannerStatus get status => statusNotifer.value;
  set status(BarCodeScannerStatus barCodeScannerStatus) =>
      statusNotifer.value = barCodeScannerStatus;

  var barcodeScanner = GoogleMlKit.vision.barcodeScanner();
  CameraController? cameraController;

  InputImage? imagePicker;

  /// Pegar câmeras disponíveis
  void getAvailableCameras() async {
    try {
      final response = await availableCameras();
      // vai pegar a camera quando a camera de tras estiver disponivel
      // first where pq o dispositivo pode ter mais de uma camera
      final camera = response.firstWhere(
        (element) => element.lensDirection == CameraLensDirection.back,
      );

      cameraController = CameraController(
        camera,
        ResolutionPreset.max,
        enableAudio: false,
      );

      await cameraController!.initialize();

      // status = BarCodeScannerStatus.available(cameraController);
      scanWithCamera();
      listenCamera();
    } catch (e) {
      status = BarCodeScannerStatus.error(e.toString());
    }
  }

  // Ouvir a câmera e pegar a imagem da câmera
  void listenCamera() {
    // se nao tiver comecado a "Ouvir" a img, vai comecar
    if (cameraController!.value.isStreamingImages == false)
      cameraController!.startImageStream((cameraImage) async {
        if (status.stopScanner == false) {
          try {
            final WriteBuffer allBytes = WriteBuffer();
            for (Plane plane in cameraImage.planes) {
              allBytes.putUint8List(plane.bytes);
            }
            final bytes = allBytes.done().buffer.asUint8List();
            final Size imageSize = Size(
                cameraImage.width.toDouble(), cameraImage.height.toDouble());
            final InputImageRotation imageRotation =
                InputImageRotation.Rotation_0deg;
            final InputImageFormat inputImageFormat =
                InputImageFormatMethods.fromRawValue(cameraImage.format.raw) ??
                    InputImageFormat.NV21;
            final planeData = cameraImage.planes.map(
              (Plane plane) {
                return InputImagePlaneMetadata(
                  bytesPerRow: plane.bytesPerRow,
                  height: plane.height,
                  width: plane.width,
                );
              },
            ).toList();

            final inputImageData = InputImageData(
              size: imageSize,
              imageRotation: imageRotation,
              inputImageFormat: inputImageFormat,
              planeData: planeData,
            );
            final inputImageCamera = InputImage.fromBytes(
                bytes: bytes, inputImageData: inputImageData);
            scannerBarCode(inputImageCamera);
          } catch (e) {
            print(e);
          }
        }
      });
  }

  /// Opção de escanear com a câmera
  void scanWithCamera() {
    status = BarCodeScannerStatus.available();
    Future.delayed(Duration(seconds: 20)).then((value) {
      if (status.hasBarcode == false) {
        status = BarCodeScannerStatus.error("Timeout de leitura do boleto");
      }
    });
  }

  /// Vai escanear o código de barras na imagem passada
  Future<void> scannerBarCode(InputImage inputImage) async {
    try {
      // if (status.cameraController != null) {
      //   if (status.cameraController!.value.isStreamingImages) {
      //     status.cameraController!.stopImageStream();
      //   }
      // }
      final barcodes = await barcodeScanner.processImage(inputImage);
      var barcode;
      for (Barcode item in barcodes) {
        barcode = item.value.displayValue;
      }

      if (barcode != null && status.barcode.isEmpty) {
        status = BarCodeScannerStatus.barcode(barcode);
        cameraController!.dispose();
        await barcodeScanner.close();
        // status.cameraController!.dispose(); //fechar camera
      }

      return;
    } catch (e) {
      print("Erro na leitura. Erro: $e");
    }
  }

  /// Opção de de escanear a partir de uma imagem
  void scanWithImagePicker() async {
    // await status.cameraController!.stopImageStream();
    final response = await ImagePicker().getImage(source: ImageSource.gallery);
    final inputImage = InputImage.fromFilePath(response!.path);
    scannerBarCode(inputImage);
  }

  void dispose() {
    statusNotifer.dispose();
    barcodeScanner.close();
    if (status.showCamera) {
      cameraController!.dispose();
    }
  }
}
