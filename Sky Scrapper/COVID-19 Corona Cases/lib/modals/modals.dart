class Covid19Data {
  final String name;
  final int todayDeaths;
  final int todayConfirmed;
  final int totalDeaths;
  final int totalConfirmed;
  final int totalCritical;
  final int totalRecovered;
  dynamic recoveryRate;

  Covid19Data({
    required this.name,
    required this.todayDeaths,
    required this.todayConfirmed,
    required this.totalDeaths,
    required this.totalConfirmed,
    required this.totalCritical,
    required this.totalRecovered,
    required this.recoveryRate,
  });

  factory Covid19Data.fromJSON({required Map json}) {
    return Covid19Data(
        name: json["name"],
        todayDeaths: json["today"]["deaths"],
        todayConfirmed: json["today"]["confirmed"],
        totalDeaths: json["latest_data"]["deaths"],
        totalConfirmed: json["latest_data"]["confirmed"],
        totalCritical: json["latest_data"]["critical"],
        totalRecovered: json["latest_data"]["recovered"],
        recoveryRate: json["latest_data"]["calculated"]["recovery_rate"]);
  }
}
