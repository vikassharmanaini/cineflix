// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserProfileModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProfileAdapter extends TypeAdapter<Profile> {
  @override
  final int typeId = 1;

  @override
  Profile read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Profile(
      accountId: fields[0] as String?,
      profileImage: fields[1] as String?,
      isPrimaryProfile: fields[2] as String?,
      userName: fields[3] as String?,
      walletAddress: fields[4] as String?,
      mobile: fields[5] as String?,
      profileNo: fields[6] as int?,
      countProfiles: fields[7] as int?,
      prefrence: (fields[8] as Map?)?.cast<dynamic, dynamic>(),
      profileToken: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Profile obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.accountId)
      ..writeByte(1)
      ..write(obj.profileImage)
      ..writeByte(2)
      ..write(obj.isPrimaryProfile)
      ..writeByte(3)
      ..write(obj.userName)
      ..writeByte(4)
      ..write(obj.walletAddress)
      ..writeByte(5)
      ..write(obj.mobile)
      ..writeByte(6)
      ..write(obj.profileNo)
      ..writeByte(7)
      ..write(obj.countProfiles)
      ..writeByte(8)
      ..write(obj.prefrence)
      ..writeByte(9)
      ..write(obj.profileToken);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
