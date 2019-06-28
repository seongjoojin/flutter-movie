class TVsSearchResult {
  int page;
  int totalResults;
  int totalPages;
  List<Results> results;

  TVsSearchResult(
      {this.page, this.totalResults, this.totalPages, this.results});

  TVsSearchResult.fromJson(Map<String, dynamic> json) {
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
  int id;
  String name;
  int voteCount;
  double voteAverage;
  String posterPath;
  String firstAirDate;
  double popularity;
  List<int> genreIds;
  String originalLanguage;
  String backdropPath;
  String overview;
  List<String> originCountry;

  Results(
      {this.originalName,
      this.id,
      this.name,
      this.voteCount,
      this.voteAverage,
      this.posterPath,
      this.firstAirDate,
      this.popularity,
      this.genreIds,
      this.originalLanguage,
      this.backdropPath,
      this.overview,
      this.originCountry});

  Results.fromJson(Map<String, dynamic> json) {
    originalName = json['original_name'];
    id = json['id'];
    name = json['name'];
    voteCount = json['vote_count'];
    voteAverage = json['vote_average'];
    posterPath = json['poster_path'];
    firstAirDate = json['first_air_date'];
    popularity = json['popularity'];
    genreIds = json['genre_ids'].cast<int>();
    originalLanguage = json['original_language'];
    backdropPath = json['backdrop_path'];
    overview = json['overview'];
    originCountry = json['origin_country'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['original_name'] = this.originalName;
    data['id'] = this.id;
    data['name'] = this.name;
    data['vote_count'] = this.voteCount;
    data['vote_average'] = this.voteAverage;
    data['poster_path'] = this.posterPath;
    data['first_air_date'] = this.firstAirDate;
    data['popularity'] = this.popularity;
    data['genre_ids'] = this.genreIds;
    data['original_language'] = this.originalLanguage;
    data['backdrop_path'] = this.backdropPath;
    data['overview'] = this.overview;
    data['origin_country'] = this.originCountry;
    return data;
  }
}
