import 'dart:convert';

import 'package:http/http.dart' as http;


final String apiUrl = 'https://angular-notch-391413.el.r.appspot.com';

Future<http.Response> getAllCities() async {

  try {
    final response = await http.get(
      Uri.parse('https://angular-notch-391413.el.r.appspot.com/public/cities3.json'),
    );
    print(response.body);
    return response;
  } catch (error) {
    throw error;
  }
}