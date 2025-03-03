import 'dart:convert';

ResponsePokemonList responsePokemonListFromJson(String str) =>
    ResponsePokemonList.fromJson(json.decode(str));

class ResponsePokemonList {
  final int? count;
  final String? next;
  final dynamic previous;
  final List<Result>? results;

  ResponsePokemonList({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory ResponsePokemonList.fromJson(Map<String, dynamic> json) =>
      ResponsePokemonList(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: json["results"] == null
            ? []
            : List<Result>.from(
                json["results"]!.map((x) => Result.fromJson(x))),
      );
}

class Result {
  final String? name;
  final String? url;

  Result({
    this.name,
    this.url,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"],
        url: json["url"],
      );
}
