part of 'dog_cubit.dart';

class DogState extends Equatable {
  final List<DogResDto> dogs;
  final PageStatus status;

  const DogState({
    this.dogs = const [],
    this.status = PageStatus.initial,
  });

  DogState copyWith({
    List<DogResDto>? dogs,
    PageStatus? status,
  }) {
    return DogState(
      dogs: dogs ?? this.dogs,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
    dogs,
    status,
  ];
}
