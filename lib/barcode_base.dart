library barcode_base;

import 'package:barcode_base/src/barcode_enum.dart';
import 'package:barcode_flutter/barcode_flutter.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

export 'src/barcode_enum.dart';
typedef BarCodeViewError = void Function(dynamic error);


class BarCodeView {

  static autoBuildBarCode({@required data,@required codeType,
    double lineWidth = 2.0, double barHeight = 100.0, hasText = false,
    double size, BarCodeViewError onError}){

    var codeT = _parseCodeType(codeType.toString());

      if (codeT == BarCodeFormat.CodeQR) {

        return buildQrCode(data, size, onError);

      } else {

        return buildBarCode(data: data, codeType: codeT, barHeight: barHeight,hasText: hasText, onError: onError);
      }

  }

  static buildBarCode({@required data,
    @required codeType, double lineWidth = 2.0, double barHeight = 100.0, hasText = false,BarCodeViewError onError}) {

    var codeT = _parseCodeType(codeType.toString());
    if (codeT != null && codeT == BarCodeFormat.CodeQR) {
      String errorMsg = "Can't accept BarCodeFormat.CodeQR as a Parameter!";
      if (onError != null) {
        onError(errorMsg);
      } else {
        print(errorMsg);
      }
      return null;
    }

    return BarCodeImage(data: data, codeType: codeType, lineWidth: lineWidth, barHeight: barHeight, hasText: hasText, onError: onError);

  }

  static buildQrCode(@required data, double size, BarCodeViewError onError) {

    return QrImage(data: data, size: size,onError: onError);

  }

  static _parseCodeType(String codeType) {

    switch (codeType) {
      case "BarcodeFormat.EAN_13":
      case "BarCodeFormat.CodeEAN13":
        return BarCodeType.CodeEAN13;
      case "BarcodeFormat.EAN_8":
      case "BarCodeFormat.CodeEAN8":
        return BarCodeType.CodeEAN8;
      case "BarcodeFormat.CODE_39":
      case "BarCodeFormat.Code39":
        return BarCodeType.Code39;
      case "BarcodeFormat.CODE_93":
      case "BarCodeFormat.Code93":
        return BarCodeType.Code93;
      case "BarcodeFormat.UPC_A":
      case "BarCodeFormat.CodeUPCA":
        return BarCodeType.CodeUPCA;
      case "BarcodeFormat.UPC_E":
      case "BarCodeFormat.CodeUPCE":
        return BarCodeType.CodeUPCE;
      case "BarcodeFormat.CODE_128":
      case "BarCodeFormat.Code128":
        return BarCodeType.Code128;
      case "BarcodeFormat.QR_CODE":
      case "BarCodeFormat.CodeQR":
        return BarCodeFormat.CodeQR;
      default:
        return null;

    }

  }

}

