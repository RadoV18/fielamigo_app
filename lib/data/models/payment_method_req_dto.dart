class PaymentMethodReqDto {
  String name;
  String numbers;
  String expirationDate;

  PaymentMethodReqDto({
    required this.name,
    required this.numbers,
    required this.expirationDate
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'numbers': numbers,
      'expirationDate': expirationDate,
    };
  }
}
