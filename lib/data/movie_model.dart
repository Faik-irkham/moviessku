class MovieModel {
  int? id;
  String? judul;
  String? image;
  String? tahun;
  String? durasi;
  String? rating;
  String? genre;
  String? plot;

  MovieModel({
    this.id,
    this.judul,
    this.image,
    this.tahun,
    this.durasi,
    this.rating,
    this.genre,
    this.plot,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json["id"],
        judul: json["Judul"],
        image: json["image"],
        tahun: json["tahun"],
        durasi: json["durasi"],
        rating: json["rating"],
        genre: json["Genre"],
        plot: json["plot"],
      );

  MovieModel copyWith({
    int? id,
    String? judul,
    String? image,
    String? tahun,
    String? durasi,
    String? rating,
    String? genre,
    String? plot,
  }) =>
      MovieModel(
        id: id ?? this.id,
        judul: judul ?? this.judul,
        image: image ?? this.image,
        tahun: tahun ?? this.tahun,
        durasi: durasi ?? this.durasi,
        rating: rating ?? this.rating,
        genre: genre ?? this.genre,
        plot: plot ?? this.plot,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Judul": judul,
        "image": image,
        "tahun": tahun,
        "durasi": durasi,
        "rating": rating,
        "Genre": genre,
        "plot": plot,
      };
}
