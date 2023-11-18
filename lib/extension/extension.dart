import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

extension ImageConversion on File {

  Future<String> encodeToString() async {
    Uint8List imageBytes = await readAsBytes();
    String bs4str = base64.encode(imageBytes);
    return bs4str;
  }

}
