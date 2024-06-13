import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Utils {
  Utils._();

  static String baseUrl = 'http://192.168.1.3:8000/';
  // static String baseUrl = 'http://192.168.188.183:8000/';
  // static String baseUrl = 'http://makarya_backend.test/';

  static Uri getApiUri(String endpoint) {
    return Uri.parse('${baseUrl}api$endpoint');
  }

  static Map<String, String> requestHeaders({
    String token = '',
    String contentType = 'application/json; charset=UTF-8',
  }) =>
      {
        'Content-Type': contentType,
        'Authorization': 'Bearer $token',
      };

  static Color primaryColor = const Color.fromRGBO(58, 24, 5, 1);
  static Color getPrimaryColor(BuildContext context) =>
      Theme.of(context).colorScheme.primary;

  static TextStyle textRegular = GoogleFonts.poppins();
  static TextStyle textStyle({
    double size = 14,
    FontWeight weight = FontWeight.normal,
    Color color = Colors.black,
  }) {
    return GoogleFonts.poppins(
      textStyle: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: weight,
      ),
    );
  }
}
