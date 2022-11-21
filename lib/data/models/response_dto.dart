class ResponseDto<T> {
  final T? data;
  final String? message;
  final bool succesful;

  ResponseDto({this.data, this.message, required this.succesful});

  factory ResponseDto.fromJson(Map<String, dynamic> json) {
    return ResponseDto(
      data: json['data'],
      message: json['message'] ?? '',
      succesful: json['successful'],
    );
  }
}