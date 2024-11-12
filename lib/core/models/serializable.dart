class LoginResponse {
  final bool success;
  final String msg;
  final String accountToken;
  final AccountDetail accountDetail;

  LoginResponse({
    required this.success,
    required this.msg,
    required this.accountToken,
    required this.accountDetail,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      success: json['success'],
      msg: json['msg'],
      accountToken: json['accountToken'],
      accountDetail: AccountDetail.fromJson(json['accountDetail']),
    );
  }
}

class AccountDetail {
  final String id;
  final String mobile;
  final String walletAddress;
  final List<String> profiles;
  final bool isPrimaryProfileDone;
  final List<Token> tokens;
  final String createdAt;
  final String updatedAt;
  final int v;

  AccountDetail({
    required this.id,
    required this.mobile,
    required this.walletAddress,
    required this.profiles,
    required this.isPrimaryProfileDone,
    required this.tokens,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory AccountDetail.fromJson(Map<String, dynamic> json) {
    return AccountDetail(
      id: json['_id'],
      mobile: json['mobile'],
      walletAddress: json['walletAddress'],
      profiles: List<String>.from(json['profiles']),
      isPrimaryProfileDone: json['isPrimaryProfileDone'],
      tokens: List<Token>.from(json['tokens'].map((token) => Token.fromJson(token))),
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
    );
  }
}

class Token {
  final String token;
  final String expiresAt;
  final String id;
  final String issuedAt;

  Token({
    required this.token,
    required this.expiresAt,
    required this.id,
    required this.issuedAt,
  });

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      token: json['token'],
      expiresAt: json['expiresAt'],
      id: json['_id'],
      issuedAt: json['issuedAt'],
    );
  }
}
