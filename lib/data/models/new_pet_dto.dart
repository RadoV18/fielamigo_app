import 'dart:io';

class NewPetDto {
  String userId;
  String name;
  String breed;
  String birthDate;
  bool isMale;
  int size;
  bool isSterilized;
  String notes;
  File image;
  
  NewPetDto({
    required this.userId,
    required this.name,
    required this.breed,
    required this.birthDate,
    required this.isMale,
    required this.size,
    required this.isSterilized,
    required this.notes,
    required this.image
  });
}