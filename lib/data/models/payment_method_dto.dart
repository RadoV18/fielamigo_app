class PaymentMethodDto {
  final int paymentMethodId;
  final int lastDigits;
  final String expirationDate;
  final String name;

  PaymentMethodDto({
    required this.paymentMethodId,
    required this.lastDigits,
    required this.expirationDate,
    required this.name,
  });

  factory PaymentMethodDto.fromJson(Map<String, dynamic> json) {
    return PaymentMethodDto(
      paymentMethodId: json['paymentMethodId'],
      lastDigits: json['lastDigits'],
      expirationDate: json['expirationDate'],
      name: json['name'],
    );
  }

  String getExpirationDate() {
    String expDate = expirationDate;
    return '${expDate.substring(5, 7)}/${expDate.substring(2, 4)}';
  }
}