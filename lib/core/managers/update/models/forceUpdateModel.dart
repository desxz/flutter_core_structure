import 'package:flutter_core_structure/core/base/baseModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forceUpdateModel.g.dart';

@JsonSerializable()
class ForceUpdateModel extends BaseModel {
  bool? isForceUpdate;
  String? type;
  String? currentVersion;

  ForceUpdateModel({this.isForceUpdate, this.type, this.currentVersion});

  @override
  ForceUpdateModel fromJson(Map<String, dynamic> json) => _$ForceUpdateModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ForceUpdateModelToJson(this);
}
