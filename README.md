# barcode_base

A new Flutter package project.

## Getting Started

This project is a starting point for a Dart
[package](https://flutter.io/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.io/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.

## 使用库
qr_flutter
barcode_flutter

##使用：
Padding (
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: BarCodeView.autoBuildBarCode(data: barcode, codeType: barcode_format, hasText: true, size: 100,onError: (ex) {
                print('[QR] ERROR - $ex');
              }),
