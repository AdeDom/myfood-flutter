// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FoodEntityAdapter extends TypeAdapter<FoodEntity> {
  @override
  final int typeId = 2;

  @override
  FoodEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FoodEntity(
      foodId: fields[0] as int?,
      foodName: fields[1] as String?,
      alias: fields[2] as String?,
      image: fields[3] as String?,
      ratingScoreCount: fields[4] as String?,
      categoryId: fields[9] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, FoodEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.foodId)
      ..writeByte(1)
      ..write(obj.foodName)
      ..writeByte(2)
      ..write(obj.alias)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.ratingScoreCount)
      ..writeByte(9)
      ..write(obj.categoryId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FoodEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
