import 'dart:io';
import 'package:globaltrailblazersapp/shared/funcs.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class ReadBookPDFService {
  static Future<File?> loadFromNetwork(String url) async {
    try {
      Uri uri = Uri.parse(url);
      final response = await http.get(uri);
      final bytes = response.bodyBytes;
      return _storeFile(url, bytes);
    } on SocketException catch (_) {
      showToast(
        message: "No internet, Internet connection problem detected",
        success: false,
      );
      return null;
    } catch (e) {
      return null;
    }
  }

  static Future<File> _storeFile(String url, List<int> bytes) async {
    final filename = basename(url);
    final dir = await getApplicationDocumentsDirectory();

    final file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }
}
