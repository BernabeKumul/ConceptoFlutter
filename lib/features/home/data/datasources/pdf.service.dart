import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
// import 'package:path_provider/path_provider.dart';

class ApiService{
  static final String url = "https://www.fdi.ucm.es/profesor/luis/fp/fp.pdf";

  static Future<String>  loadPDF() async {
    var response = await http.get(url);
    var dir = await getTemporaryDirectory();

    File file = new File(dir.path + "/data5.pdf");

    await file.writeAsBytesSync(response.bodyBytes, flush: true);

    return file.path;
     
  }
}