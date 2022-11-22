import 'dart:io';

class DogReqDto {
  String name;
  int breed;
  String birthDate;
  bool isMale;
  int size;
  bool isSterilized;
  String notes;
  
  DogReqDto({
    required this.name,
    required this.breed,
    required this.birthDate,
    required this.isMale,
    required this.size,
    required this.isSterilized,
    required this.notes,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'breed': breed,
      'birthDate': birthDate,
      'isMale': isMale,
      'size': size,
      'isSterilized': isSterilized,
      'notes': notes,
    };
  }

  factory DogReqDto.fromJson(Map<String, dynamic> json) {
    return DogReqDto(
      name: json['name'],
      breed: json['breed'],
      birthDate: json['birthDate'],
      isMale: json['isMale'],
      size: json['size'],
      isSterilized: json['isSterilized'],
      notes: json['notes'],
    );
  }
}