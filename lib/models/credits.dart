// To parse this JSON data, do
//
//     final creditos = creditosFromJson(jsonString);

import 'dart:convert';

Creditos creditosFromJson(String str) => Creditos.fromJson(json.decode(str));

String creditosToJson(Creditos data) => json.encode(data.toJson());

class Creditos {
  Creditos({
    required this.id,
    required this.cast,
    required this.crew,
  });

  int id;
  List<Cast> cast;
  List<Cast> crew;

  factory Creditos.fromJson(Map<String, dynamic> json) => Creditos(
        id: json["id"],
        cast: List<Cast>.from(json["cast"].map((x) => Cast.fromJson(x))),
        crew: List<Cast>.from(json["crew"].map((x) => Cast.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cast": List<dynamic>.from(cast.map((x) => x.toJson())),
        "crew": List<dynamic>.from(crew.map((x) => x.toJson())),
      };
}

class Cast {
  Cast({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    required this.creditId,
    this.order,
    this.department,
    this.job,
  });

  bool adult;
  int gender;
  int id;
  Department? knownForDepartment;
  String name;
  String originalName;
  double popularity;
  String? profilePath;
  int? castId;
  String? character;
  String creditId;
  int? order;
  Department? department;
  String? job;
  get fullPosterImg {
    if (profilePath != null) {
      return 'https://image.tmdb.org/t/p/w500/$profilePath';
    } else {
      return 'https://st.depositphotos.com/1779253/5140/v/600/depositphotos_51405259-stock-illustration-male-avatar-profile-picture-use.jpg';
    }
  }

  factory Cast.fromJson(Map<String, dynamic> json) => Cast(
        adult: json["adult"],
        gender: json["gender"],
        id: json["id"],
        knownForDepartment: ( (json["knownForDepartment"]!=null) ?  departmentValues.map[json["department"]] : departmentValues.map['Writing']),
        name: json["name"],
        originalName: json["original_name"],
        popularity: json["popularity"]?.toDouble(),
        profilePath: json["profile_path"],
        castId: json["cast_id"] ?? 0,
        character: json["character"] ?? '',
        creditId: json["credit_id"] ?? '',
        order: json["order"],
        department: ( (json["department"]!=null) ?  departmentValues.map[json["department"]] : departmentValues.map['Writing']),
        job: json["job"] ?? '',
      );
  // json["department"] ?  departmentValues.map[json["department"]] :
  // json["department"]

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "gender": gender,
        "id": id,
        "known_for_department": departmentValues.reverse[knownForDepartment],
        "name": name,
        "original_name": originalName,
        "popularity": popularity,
        "profile_path": profilePath,
        "cast_id": castId,
        "character": character,
        "credit_id": creditId,
        "order": order,
        "department": departmentValues.reverse[department],
        "job": job,
      };
}

enum Department { ACTING, CREW, DIRECTING, PRODUCTION, WRITING }

final departmentValues = EnumValuesCast({
  "Acting": Department.ACTING,
  "Crew": Department.CREW,
  "Directing": Department.DIRECTING,
  "Production": Department.PRODUCTION,
  "Writing": Department.WRITING
});

class EnumValuesCast<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValuesCast(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
