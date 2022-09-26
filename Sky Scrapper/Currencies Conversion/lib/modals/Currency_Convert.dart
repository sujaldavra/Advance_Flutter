class CurrencyConvert {
  final double total;
  final double rate;

  CurrencyConvert({
    required this.total,
    required this.rate,
  });

  factory CurrencyConvert.fromJSON({required Map<String, dynamic> json}) {
    return CurrencyConvert(
      total: json["result"],
      rate: json["info"]["rate"],
    );
  }
}
