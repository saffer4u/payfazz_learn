import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class Address extends Equatable {
  final String landmark;
  final String userDistrict;
  final int pin;
  const Address({
    required this.userDistrict,
    required this.landmark,
    required this.pin,
  });
  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);

  @override
  List<Object> get props => [
        landmark,
        userDistrict,
        pin,
      ];
}
