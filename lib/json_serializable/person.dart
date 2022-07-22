import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:payfazz_learn/json_serializable/address.dart';

part 'person.g.dart';

@JsonSerializable()
class Person extends Equatable {
  final String? name;
  final DateTime? dob;
  final List<Address>? address;
  const Person({
    required this.name,
    required this.dob,
    required this.address,
  });

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);

  @override
  List<Object?> get props => [name, dob, address];
}
