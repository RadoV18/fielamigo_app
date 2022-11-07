part of 'add_pet_cubit.dart';

class AddPetState extends Equatable {
  final File? image;
  final String name;
  final String breed;
  final String birthDate;
  final bool isMale;
  final bool isFemale;
  final bool isSmall;
  final bool isMedium;
  final bool isLarge;
  final bool isSterilized;
  final String notes;

  const AddPetState({
    this.image,
    this.name = '',
    this.breed = '',
    this.birthDate = '',
    this.isMale = false,
    this.isFemale = false,
    this.isSmall = false,
    this.isMedium = false,
    this.isLarge = false,
    this.isSterilized = false,
    this.notes = ''
  });

  AddPetState copyWith({
    File? image,
    String? name,
    String? breed,
    String? birthDate,
    bool? isMale,
    bool? isFemale,
    bool? isSmall,
    bool? isMedium,
    bool? isLarge,
    bool? isSterilized,
    String? notes
  }) => AddPetState(
    image: image ?? this.image,
    name: name ?? this.name,
    breed: breed ?? this.breed,
    birthDate: birthDate ?? this.birthDate,
    isMale: isMale ?? this.isMale,
    isFemale: isFemale ?? this.isFemale,
    isSmall: isSmall ?? this.isSmall,
    isMedium: isMedium ?? this.isMedium,
    isLarge: isLarge ?? this.isLarge,
    isSterilized: isSterilized ?? this.isSterilized,
    notes: notes ?? this.notes
  );

  @override
  List<Object?> get props => [
    image,
    name,
    breed,
    birthDate,
    isMale,
    isFemale,
    isSmall,
    isMedium,
    isLarge,
    isSterilized,
    notes
  ];
}