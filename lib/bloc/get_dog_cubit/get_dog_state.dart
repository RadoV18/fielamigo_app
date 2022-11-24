part of 'get_dog_cubit.dart';

class GetDogState extends Equatable {
  final int? dogId;
  final int? userId;
  final String? name;
  final DateTime? birthDate;
  final String? size;
  final String? breed;
  final String? notes;
  final bool? isSterilized;
  final bool? isMale;
  final String? imageUrl;
  final PageStatus status;

  const GetDogState({
    this.dogId,
    this.userId,
    this.name,
    this.birthDate,
    this.size,
    this.breed,
    this.notes,
    this.isSterilized,
    this.isMale,
    this.imageUrl,
    this.status = PageStatus.initial,
  });

  GetDogState copyWith({
    int? dogId,
    int? userId,
    String? name,
    DateTime? birthDate,
    String? size,
    String? breed,
    String? notes,
    bool? isSterilized,
    bool? isMale,
    String? imageUrl,
    PageStatus? status,
  }) {
    return GetDogState(
      dogId: dogId ?? this.dogId,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      birthDate: birthDate ?? this.birthDate,
      size: size ?? this.size,
      breed: breed ?? this.breed,
      notes: notes ?? this.notes,
      isSterilized: isSterilized ?? this.isSterilized,
      isMale: isMale ?? this.isMale,
      imageUrl: imageUrl ?? this.imageUrl,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
    dogId,
    userId,
    name,
    birthDate,
    size,
    breed,
    notes,
    isSterilized,
    isMale,
    imageUrl,
    status,
  ];
}

