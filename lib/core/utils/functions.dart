import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';

String formatWithCommas(String numberString) {
  // Reverse the string to process from right to left
  String reversed = numberString.split('').reversed.join();
  StringBuffer formatted = StringBuffer();

  for (int i = 0; i < reversed.length; i++) {
    if (i > 0 && i % 3 == 0) {
      formatted.write(','); // Add a comma every 3 digits
    }
    formatted.write(reversed[i]);
  }

  // Reverse the result to get the final formatted string
  return formatted.toString().split('').reversed.join();
}

///Convert svg to platform file
// PlatformFile svgStringToPlatformFile(String svgContent,
//     {String fileName = 'target.svg'}) {
//   // Convert the SVG string to bytes
//   Uint8List svgBytes = Uint8List.fromList(svgContent.codeUnits);
//
//   return PlatformFile(
//     name: fileName,
//     size: svgBytes.length,
//     bytes: svgBytes,
//     path: null, // Since this is an in-memory file
//   );
// }

bool isLoggedOut(String state) {
  if (state.contains("Unauthenticated")) {
    return true;
  }
  return false;
}
