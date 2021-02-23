// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resume_owner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ResumeOwner _$_$_ResumeOwnerFromJson(Map<String, dynamic> json) {
  return _$_ResumeOwner(
    name: json['name'] as String,
    from: json['from'] as String,
    searchingJobs: json['searchingJobs'] as String,
    subtitle: json['subtitle'] as String,
    create: (json['create'] as List)?.map((e) => e as String)?.toList(),
    like: (json['like'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$_$_ResumeOwnerToJson(_$_ResumeOwner instance) =>
    <String, dynamic>{
      'name': instance.name,
      'from': instance.from,
      'searchingJobs': instance.searchingJobs,
      'subtitle': instance.subtitle,
      'create': instance.create,
      'like': instance.like,
    };
