import 'dart:convert';

import 'package:fielamigo_app/data/models/new_pet_dto.dart';
import 'package:http/http.dart' as http;

import 'api.dart';

class PetProvider {
  final String _url = Api.url;

  Future<NewPetDto> addPet(NewPetDto newPetDto) async {
    // TODO: test this
    // TODO: it should return a PetDto that contains the id of the pet and the s3 url
    final String url = '$_url/pets';
    http.MultipartRequest request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields['name'] = newPetDto.name;
    request.fields['breed'] = newPetDto.breed;
    request.fields['birthDate'] = newPetDto.birthDate;
    request.fields['isMale'] = newPetDto.isMale.toString();
    request.fields['size'] = newPetDto.size.toString();
    request.fields['isSterilized'] = newPetDto.isSterilized.toString();
    request.fields['notes'] = newPetDto.notes;
    request.files.add(
      http.MultipartFile.fromBytes(
        'image',
        newPetDto.image.readAsBytesSync(),
        filename: newPetDto.image.path.split('/').last,
      ),
    );
    
    http.StreamedResponse response = await request.send();
    if(response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
    return newPetDto;
  }
}