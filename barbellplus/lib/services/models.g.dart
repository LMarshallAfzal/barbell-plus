// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String? ?? '',
      username: json['username'] as String? ?? '',
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      password: json['password'] as String? ?? '',
      image: json['image'] as String? ?? '',
      isAdmin: json['isAdmin'] as bool? ?? false,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'image': instance.image,
      'isAdmin': instance.isAdmin,
    };

Exercise _$ExerciseFromJson(Map<String, dynamic> json) => Exercise(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      image: json['image'] as String? ?? '',
      recordType:
          $enumDecodeNullable(_$RecordTypeEnumMap, json['recordType']) ??
              RecordType.weightAndReps,
      primaryMuscleGroup: json['primaryMuscleGroup'] as String? ?? '',
      secondaryMuscleGroup: (json['secondaryMuscleGroup'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ExerciseToJson(Exercise instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'recordType': _$RecordTypeEnumMap[instance.recordType],
      'primaryMuscleGroup': instance.primaryMuscleGroup,
      'secondaryMuscleGroup': instance.secondaryMuscleGroup,
    };

const _$RecordTypeEnumMap = {
  RecordType.weightAndReps: 'weightAndReps',
  RecordType.repsOnly: 'repsOnly',
  RecordType.time: 'time',
  RecordType.timeAndWeight: 'timeAndWeight',
  RecordType.distance: 'distance',
};

Workout _$WorkoutFromJson(Map<String, dynamic> json) => Workout(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      image: json['image'] as String? ?? 'default.png',
      numberOfWeeklySessions: json['numberOfWeeklySessions'] as int? ?? 0,
      durationInWeeks: json['durationInWeeks'] as int? ?? 0,
      exercises: (json['exercises'] as List<dynamic>?)
              ?.map((e) => Session.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$WorkoutToJson(Workout instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'numberOfWeeklySessions': instance.numberOfWeeklySessions,
      'durationInWeeks': instance.durationInWeeks,
      'exercises': instance.exercises,
    };

Session _$SessionFromJson(Map<String, dynamic> json) => Session(
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      exercises: (json['exercises'] as List<dynamic>?)
              ?.map((e) => ExerciseElement.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$SessionToJson(Session instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'exercises': instance.exercises,
    };

ExerciseElement _$ExerciseElementFromJson(Map<String, dynamic> json) =>
    ExerciseElement(
      id: json['id'] as int? ?? 0,
      exercise: json['exercise'] == null
          ? null
          : Exercise.fromJson(json['exercise'] as Map<String, dynamic>),
      targetReps: (json['targetReps'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          const [],
      targetSets: (json['targetSets'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          const [],
      sets: (json['sets'] as List<dynamic>?)?.map((e) => e as int).toList() ??
          const [],
      reps: (json['reps'] as List<dynamic>?)?.map((e) => e as int).toList() ??
          const [],
      weight:
          (json['weight'] as List<dynamic>?)?.map((e) => e as int).toList() ??
              const [],
      rest: json['rest'] as int? ?? 0,
    );

Map<String, dynamic> _$ExerciseElementToJson(ExerciseElement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'exercise': instance.exercise,
      'targetReps': instance.targetReps,
      'targetSets': instance.targetSets,
      'sets': instance.sets,
      'reps': instance.reps,
      'weight': instance.weight,
      'rest': instance.rest,
    };
