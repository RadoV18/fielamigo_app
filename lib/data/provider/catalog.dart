import 'dart:convert';

import '../models/catalog_dto.dart';
import 'package:http/http.dart' as http;

import '../models/response_dto.dart';

class CatalogProvider {
  
  // TODO: uncomment to use with Flutter
  // final String _url = "${Api}/catalogs";

  // testing url
  final String _url = "http://localhost:8080/api/v1/catalogs";

  // GET /catalogs/breeds
  Future<List<CatalogDto>> getBreeds(String token) async {
    final response = await http.get(
      Uri.parse("$_url/breeds"),
      headers: {
        'Authorization': 'Bearer $token'
      }
    );

    if(response.statusCode == 200) {
      ResponseDto backendResponse = ResponseDto.fromJson(jsonDecode(response.body));
      return backendResponse.data.map<CatalogDto>((json) => CatalogDto.fromJson(json)).toList();
    } else {
      throw Exception('Failed to get breeds');
    }
  }

  // GET /catalogs/countries
  Future<List<CatalogDto>> getCountries(String token) async {
    final response = await http.get(
      Uri.parse("$_url/countries"),
      headers: {
        'Authorization': 'Bearer $token'
      }
    );

    if(response.statusCode == 200) {
      ResponseDto backendResponse = ResponseDto.fromJson(jsonDecode(response.body));
      return backendResponse.data.map<CatalogDto>((json) => CatalogDto.fromJson(json)).toList();
    } else {
      throw Exception('Failed to get countries');
    }
  }

  // GET /catalogs/{id}/cities
  Future<List<CatalogDto>> getCities(String token, int id) async {
    final response = await http.get(
      Uri.parse("$_url/countries/$id/cities"),
      headers: {
        'Authorization': 'Bearer $token'
      }
    );

    if(response.statusCode == 200) {
      ResponseDto backendResponse = ResponseDto.fromJson(jsonDecode(response.body));
      return backendResponse.data.map<CatalogDto>((json) => CatalogDto.fromJson(json)).toList();
    } else {
      print(response.statusCode);
      throw Exception('Failed to get cities');
    }
  }
}

void main() async {
  String token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzNCIsImZpcnN0TmFtZSI6Ik1vYmlsZSB0ZXN0IDIiLCJsYXN0TmFtZSI6InRlc3RldCIsImlzT3duZXIiOnRydWUsInJvbGVzIjpbIkdFVF9DSVRJRVMiLCJHRVRfQ09VTlRSSUVTIiwiR0VUX0JSRUVEUyIsIlVQREFURV9QUk9GSUxFIiwiU0VORF9NRVNTQUdFIiwiR0VUX0RPR19CWV9JRCIsIkdFVF9PV05FUl9CT09LSU5HUyIsIkFERF9QQVlNRU5UX01FVEhPRCIsIlZJRVdfVkVURVJJTkFSSUVTIiwiQlVZX0lOU1VSQU5DRSIsIkdFVF9JTlNVUkFOQ0VfUExBTlMiLCJHRVRfUkVWSUVXUyIsIkdFVF9QUk9GSUxFIiwiQk9PS19OVVJTSU5HIiwiU0VBUkNIX05VUlNJTkciLCJCT09LX1RSQUlOSU5HIiwiU0VBUkNIX1RSQUlOSU5HIiwiQk9PS19XQUxLSU5HIiwiU0VBUkNIX1dBTEtJTkciLCJCT09LX0JPQVJESU5HIiwiU0VBUkNIX0JPQVJESU5HIiwiQUREX0RPRyIsIkdFVF9ET0dTIl0sImlzcyI6ImZpZWxhbWlnbyIsImNhcmVnaXZlcklkIjotMSwiZXhwIjoxNjY5MTY0MzUyLCJ1c2VySWQiOjM0fQ.nvrVBOkGMwj-FNNWsmVVCuV7k4E9-vtSoeKlqJrOBbY";
  CatalogProvider catalogProvider = CatalogProvider();

  // List<CatalogDto> breeds = await catalogProvider.getBreeds(token);
  // breeds.forEach((breed) => print(breed.name));

  // List<CatalogDto> countries = await catalogProvider.getCountries(token);
  // countries.forEach((country) => print("${country.name} - ${country.id}"));

  List<CatalogDto> cities = await catalogProvider.getCities(token, 332);
  cities.forEach((city) => print("${city.name} - ${city.id}"));
}