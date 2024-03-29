class TopRatedTVData {
  int page;
  int totalResults;
  int totalPages;
  List<Results> results;

  TopRatedTVData({this.page, this.totalResults, this.totalPages, this.results});

  TopRatedTVData.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    totalResults = json['total_results'];
    totalPages = json['total_pages'];
    if (json['results'] != null) {
      results = new List<Results>();
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['total_results'] = this.totalResults;
    data['total_pages'] = this.totalPages;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String originalName;
  List<int> genreIds;
  String name;
  double popularity;
  List<String> originCountry;
  int voteCount;
  String firstAirDate;
  String backdropPath;
  String originalLanguage;
  int id;
  var voteAverage;
  String overview;
  String posterPath;

  Results(
      {this.originalName,
      this.genreIds,
      this.name,
      this.popularity,
      this.originCountry,
      this.voteCount,
      this.firstAirDate,
      this.backdropPath,
      this.originalLanguage,
      this.id,
      this.voteAverage,
      this.overview,
      this.posterPath});

  Results.fromJson(Map<String, dynamic> json) {
    originalName = json['original_name'];
    genreIds = json['genre_ids'].cast<int>();
    name = json['name'];
    popularity = json['popularity'];
    originCountry = json['origin_country'].cast<String>();
    voteCount = json['vote_count'];
    firstAirDate = json['first_air_date'];
    backdropPath = json['backdrop_path'];
    originalLanguage = json['original_language'];
    id = json['id'];
    voteAverage = json['vote_average'];
    overview = json['overview'];
    posterPath = json['poster_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['original_name'] = this.originalName;
    data['genre_ids'] = this.genreIds;
    data['name'] = this.name;
    data['popularity'] = this.popularity;
    data['origin_country'] = this.originCountry;
    data['vote_count'] = this.voteCount;
    data['first_air_date'] = this.firstAirDate;
    data['backdrop_path'] = this.backdropPath;
    data['original_language'] = this.originalLanguage;
    data['id'] = this.id;
    data['vote_average'] = this.voteAverage;
    data['overview'] = this.overview;
    data['poster_path'] = this.posterPath;
    return data;
  }
}
