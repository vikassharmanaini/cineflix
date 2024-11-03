// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';
part 'UserProfileModel.g.dart';

@HiveType(typeId: 1)
class Profile {
  @HiveField(0)
  String? accountId;
  @HiveField(1)
  String? profileImage;
  @HiveField(2)
  String? isPrimaryProfile;
  @HiveField(3)
  String? userName;
  @HiveField(4)
  String? walletAddress;
  @HiveField(5)
  String? mobile;
  @HiveField(6)
  int? profileNo;
  @HiveField(7)
  int? countProfiles;
  @HiveField(8)
  Map? prefrence;
  @HiveField(9)
  String? profileToken;
  Profile({
    this.accountId,
    this.profileImage,
    this.isPrimaryProfile,
    this.userName,
    this.walletAddress,
    this.mobile,
    this.profileNo,
    this.countProfiles,
    this.prefrence,
    this.profileToken,
  });

  Profile copyWith({
    String? accountId,
    String? profileImage,
    String? isPrimaryProfile,
    String? userName,
    String? walletAddress,
    String? mobile,
    int? profileNo,
    int? countProfiles,
    Map? prefrence,
    String? profileToken,
  }) {
    return Profile(
      accountId: accountId ?? this.accountId,
      profileImage: profileImage ?? this.profileImage,
      isPrimaryProfile: isPrimaryProfile ?? this.isPrimaryProfile,
      userName: userName ?? this.userName,
      walletAddress: walletAddress ?? this.walletAddress,
      mobile: mobile ?? this.mobile,
      profileNo: profileNo ?? this.profileNo,
      countProfiles: countProfiles ?? this.countProfiles,
      prefrence: prefrence ?? this.prefrence,
      profileToken: profileToken ?? this.profileToken,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accountId': accountId,
      'profileImage': profileImage,
      'isPrimaryProfile': isPrimaryProfile,
      'userName': userName,
      'walletAddress': walletAddress,
      'mobile': mobile,
      'profileNo': profileNo,
      'countProfiles': countProfiles,
      'prefrence': prefrence,
      'profileToken': profileToken,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      accountId: map['accountId']?.toString(),
      profileImage: map['profileImage']?.toString(),
      isPrimaryProfile: map['isPrimaryProfile']?.toString(),
      userName: map['userName']?.toString(),
      walletAddress: map['walletAddress']?.toString(),
      mobile: map['mobile']?.toString(),
      profileNo: map['profileNo'] != null ? map['profileNo'] as int : null,
      countProfiles: map['countProfiles'] != null ? map['countProfiles'] as int : null,
      prefrence: map['prefrence'] != null ? Map.from(map['prefrence'] as Map<String,dynamic>) : null,
      profileToken: map['profileToken']?.toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Profile.fromJson(String source) => Profile.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Profile(accountId: $accountId, profileImage: $profileImage, isPrimaryProfile: $isPrimaryProfile, userName: $userName, walletAddress: $walletAddress, mobile: $mobile, profileNo: $profileNo, countProfiles: $countProfiles, prefrence: $prefrence, profileToken: $profileToken)';
  }

  @override
  bool operator ==(covariant Profile other) {
    if (identical(this, other)) return true;
  
    return 
      other.accountId == accountId &&
      other.profileImage == profileImage &&
      other.isPrimaryProfile == isPrimaryProfile &&
      other.userName == userName &&
      other.walletAddress == walletAddress &&
      other.mobile == mobile &&
      other.profileNo == profileNo &&
      other.countProfiles == countProfiles &&
      other.prefrence == prefrence &&
      other.profileToken == profileToken;
  }

  @override
  int get hashCode {
    return accountId.hashCode ^
      profileImage.hashCode ^
      isPrimaryProfile.hashCode ^
      userName.hashCode ^
      walletAddress.hashCode ^
      mobile.hashCode ^
      profileNo.hashCode ^
      countProfiles.hashCode ^
      prefrence.hashCode ^
      profileToken.hashCode;
  }
}
