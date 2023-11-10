// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UsersModelAdapter extends TypeAdapter<UsersModel> {
  @override
  final int typeId = 0;

  @override
  UsersModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UsersModel(
      login: fields[0] as String,
      name: fields[1] as String,
      password: fields[2] as String,
      avatar: fields[3] as String,
      courses: (fields[4] as List).cast<dynamic>(),
      sex: fields[5] as bool,
      isReg: fields[6] as bool,
      telephoneNumber: fields[7] as int,
      key: fields[8] as String,
      about: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UsersModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.login)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.password)
      ..writeByte(3)
      ..write(obj.avatar)
      ..writeByte(4)
      ..write(obj.courses)
      ..writeByte(5)
      ..write(obj.sex)
      ..writeByte(6)
      ..write(obj.isReg)
      ..writeByte(7)
      ..write(obj.telephoneNumber)
      ..writeByte(8)
      ..write(obj.key)
      ..writeByte(9)
      ..write(obj.about);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UsersModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
