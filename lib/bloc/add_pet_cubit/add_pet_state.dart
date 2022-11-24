part of 'add_pet_cubit.dart';

class AddPetState extends Equatable {
  final File? image;
  final String name;
  final String breed;
  final String birthDate;
  final bool isMale;
  final bool isFemale;
  final int breedId;
  final bool isSmall;
  final bool isMedium;
  final bool isLarge;
  final bool isSterilized;
  final String notes;
  final PageStatus status;

  const AddPetState({
    this.image,
    this.name = '',
    this.breed = '',
    this.birthDate = '',
    this.isMale = false,
    this.isFemale = false,
    this.breedId = -1,
    this.isSmall = false,
    this.isMedium = false,
    this.isLarge = false,
    this.isSterilized = false,
    this.notes = '',
    this.status = PageStatus.initial
  });

  AddPetState copyWith({
    File? image,
    String? name,
    String? breed,
    String? birthDate,
    bool? isMale,
    bool? isFemale,
    int? breedId,
    bool? isSmall,
    bool? isMedium,
    bool? isLarge,
    bool? isSterilized,
    String? notes,
    PageStatus? status
  }) => AddPetState(
    image: image ?? this.image,
    name: name ?? this.name,
    breed: breed ?? this.breed,
    birthDate: birthDate ?? this.birthDate,
    isMale: isMale ?? this.isMale,
    isFemale: isFemale ?? this.isFemale,
    breedId: breedId ?? this.breedId,
    isSmall: isSmall ?? this.isSmall,
    isMedium: isMedium ?? this.isMedium,
    isLarge: isLarge ?? this.isLarge,
    isSterilized: isSterilized ?? this.isSterilized,
    notes: notes ?? this.notes,
    status: status ?? this.status
  );

  @override
  List<Object?> get props => [
    image,
    name,
    breed,
    birthDate,
    isMale,
    isFemale,
    breedId,
    isSmall,
    isMedium,
    isLarge,
    isSterilized,
    notes,
    status
  ];
}
