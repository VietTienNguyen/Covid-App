class MyCounrty {
  final String countryRegion;
  final int confirmed, recovered, deaths, active;

  MyCounrty(
      {required this.countryRegion,
      required this.confirmed,
      required this.recovered,
      required this.deaths,
      required this.active});

   factory MyCounrty.fromJson(Map<String, dynamic> country) {
    return MyCounrty(
        countryRegion: country['countryRegion'] as String,
        confirmed: country['confirmed'] as int,
        recovered: country['recovered'] as int,
        active: country['active'] as int,
        deaths: country['deaths'] as int,
    );
  }
}
