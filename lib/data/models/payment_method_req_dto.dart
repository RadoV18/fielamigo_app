class PaymentMethodReqDto {
  String name;
  String numbers;
  DateTime expirationDate;

  PaymentMethodReqDto({
    required this.name,
    required this.numbers,
    required this.expirationDate
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'numbers': numbers,
      'expirationDate': expirationDate.toIso8601String()
    };
  }

  factory PaymentMethodReqDto.fromJson(Map<String, dynamic> json) {
    return PaymentMethodReqDto(
      name: json['name'],
      numbers: json['numbers'],
      expirationDate: json['expirationDate'],
    );
  }
}
