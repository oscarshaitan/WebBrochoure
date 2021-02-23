import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'resume_owner.freezed.dart';
part 'resume_owner.g.dart';

@freezed
abstract class ResumeOwner with _$ResumeOwner {
  const factory ResumeOwner({
    @required String name,
    @required String from,
    @required String searchingJobs,
    @required String subtitle,
    @required List<String> create,
    @required List<String> like,
  }) = _ResumeOwner;

  factory ResumeOwner.fromJson(Map<String, dynamic> json) =>
      _$ResumeOwnerFromJson(json);
}
