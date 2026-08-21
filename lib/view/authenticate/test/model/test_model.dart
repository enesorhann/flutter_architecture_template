import 'package:flutter_architecture_app/core/base/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'test_model.g.dart';

@JsonSerializable()
class TestModel extends BaseModel {
  int? id;
  String? name;
  int? number;

  TestModel({this.id, this.name, this.number});

  @override
  fromJson(Map<String, dynamic> json) {
    return _$TestModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$TestModelToJson(this);
  }
}
