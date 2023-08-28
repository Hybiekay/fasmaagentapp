class UserModel {
  final String message;
  final UserData data;
  final bool status;
  final String token;

  UserModel({
    required this.message,
    required this.data,
    required this.status,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      message: json['message'],
      data: UserData.fromJson(json['data']),
      status: json['status'],
      token: json['token'],
    );
  }
}

class UserData {
  final User user;

  UserData({required this.user});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      user: User.fromJson(json['user']),
    );
  }
}

class User {
  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final String? name;
  final String? email;
  final String? phone;
  final dynamic state;
  final dynamic otp;
  final dynamic otpRef;
  final bool isVerified;
  final bool isCompletedRegistration;
  final String? accountNumber;
  final String? bankName;
  final String? accountName;
  final String? paymentOption;
  final String? ninImage;
  final String? ninImageId;
  final String? nin;
  final String? role;
  final String? month;
  final String? year;

  User({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.email,
    required this.phone,
    required this.state,
    required this.otp,
    required this.otpRef,
    required this.isVerified,
    required this.isCompletedRegistration,
    required this.accountNumber,
    required this.bankName,
    required this.accountName,
    required this.paymentOption,
    required this.ninImage,
    required this.ninImageId,
    required this.nin,
    required this.role,
    required this.month,
    required this.year,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      state: json['state'],
      otp: json['otp'],
      otpRef: json['otpRef'],
      isVerified: json['isVerified'],
      isCompletedRegistration: json['isCompletedRegistration'],
      accountNumber: json['accountNumber'],
      bankName: json['bankName'],
      accountName: json['accountName'],
      paymentOption: json['paymentOption'],
      ninImage: json['ninImage'],
      ninImageId: json['ninImageId'],
      nin: json['nin'],
      role: json['role'],
      month: json['month'],
      year: json['year'],
    );
  }
}
