// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserEntityAdapter extends TypeAdapter<UserEntity> {
  @override
  final int typeId = 0;

  @override
  UserEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserEntity(
      userId: fields[0] as String?,
      email: fields[1] as String?,
      name: fields[2] as String?,
      mobileNo: fields[3] as String?,
      address: fields[4] as String?,
      image: fields[5] as String?,
      status: fields[6] as String?,
      created: fields[7] as String?,
      updated: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserEntity obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.mobileNo)
      ..writeByte(4)
      ..write(obj.address)
      ..writeByte(5)
      ..write(obj.image)
      ..writeByte(6)
      ..write(obj.status)
      ..writeByte(7)
      ..write(obj.created)
      ..writeByte(8)
      ..write(obj.updated);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
