class Album {
  Album({
    this.wrapperType,
    this.collectionType,
    this.artistId,
    this.collectionId,
    this.amgArtistId,
    this.artistName,
    this.collectionName,
    this.collectionCensoredName,
    this.artistViewUrl,
    this.collectionViewUrl,
    this.artworkUrl60,
    this.artworkUrl100,
    this.collectionPrice,
    this.collectionExplicitness,
    this.trackCount,
    this.copyright,
    this.country,
    this.currency,
    this.releaseDate,
    this.primaryGenreName,
  });

  String? wrapperType;
  String? collectionType;
  int? artistId;
  int? collectionId;
  int? amgArtistId;
  String? artistName;
  String? collectionName;
  String? collectionCensoredName;
  String? artistViewUrl;
  String? collectionViewUrl;
  String? artworkUrl60;
  String? artworkUrl100;
  double? collectionPrice;
  String? collectionExplicitness;
  int? trackCount;
  String? copyright;
  String? country;
  String? currency;
  DateTime? releaseDate;
  String? primaryGenreName;

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        wrapperType: json["wrapperType"],
        collectionType: json["collectionType"],
        artistId: json["artistId"],
        collectionId: json["collectionId"],
        amgArtistId: json["amgArtistId"],
        artistName: json["artistName"],
        collectionName: json["collectionName"],
        collectionCensoredName: json["collectionCensoredName"],
        artistViewUrl: json["artistViewUrl"],
        collectionViewUrl: json["collectionViewUrl"],
        artworkUrl60: json["artworkUrl60"],
        artworkUrl100: json["artworkUrl100"],
        collectionPrice: json["collectionPrice"] == null
            ? 0.0
            : json["collectionPrice"].toDouble(),
        collectionExplicitness: json["collectionExplicitness"],
        trackCount: json["trackCount"],
        copyright: json["copyright"],
        country: json["country"],
        currency: json["currency"],
        releaseDate: DateTime.parse(json["releaseDate"]),
        primaryGenreName: json["primaryGenreName"],
      );

  Map<String, dynamic> toJson() => {
        "wrapperType": wrapperType,
        "collectionType": collectionType,
        "artistId": artistId,
        "collectionId": collectionId,
        "amgArtistId": amgArtistId,
        "artistName": artistName,
        "collectionName": collectionName,
        "collectionCensoredName": collectionCensoredName,
        "artistViewUrl": artistViewUrl,
        "collectionViewUrl": collectionViewUrl,
        "artworkUrl60": artworkUrl60,
        "artworkUrl100": artworkUrl100,
        "collectionPrice": collectionPrice,
        "collectionExplicitness": collectionExplicitness,
        "trackCount": trackCount,
        "copyright": copyright,
        "country": country,
        "currency": currency,
        "releaseDate":
            releaseDate == null ? '' : releaseDate!.toIso8601String(),
        "primaryGenreName": primaryGenreName,
      };
}

class Artist {
  Artist(
      {this.wrapperType,
      this.artistType,
      this.artistName,
      this.artistLinkUrl,
      this.artistId,
      this.amgArtistId,
      this.primaryGenreName,
      this.primaryGenreId,
      this.lstAlbum});

  String? wrapperType;
  String? artistType;
  String? artistName;
  String? artistLinkUrl;
  int? artistId;
  int? amgArtistId;
  String? primaryGenreName;
  int? primaryGenreId;
  List<Album>? lstAlbum = [];

  factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        wrapperType: json["wrapperType"],
        artistType: json["artistType"],
        artistName: json["artistName"],
        artistLinkUrl: json["artistLinkUrl"],
        artistId: json["artistId"],
        amgArtistId: json["amgArtistId"],
        primaryGenreName: json["primaryGenreName"],
        primaryGenreId: json["primaryGenreId"],
      );

  Map<String, dynamic> toJson() => {
        "wrapperType": wrapperType,
        "artistType": artistType,
        "artistName": artistName,
        "artistLinkUrl": artistLinkUrl,
        "artistId": artistId,
        "amgArtistId": amgArtistId,
        "primaryGenreName": primaryGenreName,
        "primaryGenreId": primaryGenreId,
      };
}
