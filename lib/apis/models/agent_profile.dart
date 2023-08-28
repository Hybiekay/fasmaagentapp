import 'dart:convert';

class PickupObject {
  Location boundNe;
  Location boundSw;
  String? polyLine;

  PickupObject({
    required this.boundNe,
    required this.boundSw,
    required this.polyLine,
  });

  factory PickupObject.fromJson(Map<String, dynamic> json) {
    return PickupObject(
      boundNe: Location.fromJson(json['boundNe']),
      boundSw: Location.fromJson(json['boundSw']),
      polyLine: json['polyLine'],
    );
  }
}

class Location {
  double? lat;
  double? lng;

  Location({
    this.lat,
    this.lng,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      lat: json['lat'],
      lng: json['lng'],
    );
  }

  Location copyWith({
    double? lat,
    double? lng,
  }) {
    return Location(
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lat': lat,
      'lng': lng,
    };
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      lat: map['lat'] != null ? map['lat'] as double : null,
      lng: map['lng'] != null ? map['lng'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'Location(lat: $lat, lng: $lng)';

  @override
  bool operator ==(covariant Location other) {
    if (identical(this, other)) return true;

    return other.lat == lat && other.lng == lng;
  }

  @override
  int get hashCode => lat.hashCode ^ lng.hashCode;
}

class DropoffObject {
  // If dropoff_object can have other properties, define them here.
  // For now, it's set to null in the provided JSON, so we leave it empty.
}

class ScheduleObject {
  // If schedule_object can have other properties, define them here.
  // For now, it's set to null in the provided JSON, so we leave it empty.
}

class AgentProfile {
  bool success;
  AgentData data;
  String message;

  AgentProfile({
    required this.success,
    required this.data,
    required this.message,
  });

  factory AgentProfile.fromJson(Map<String, dynamic> json) {
    return AgentProfile(
      success: json['success'],
      data: AgentData.fromJson(json['data']),
      message: json['message'],
    );
  }
}

class AgentData {
  Agent agent;
  int totalReferralsCounts;
  List<Referral> totalReferral;
  int totalActiveReferralsCounts;
  List<dynamic> totalActiveReferrals; // Change the type accordingly
  int totalIncome;
  List<int> totalCompletedDeliveriesCounts;
  List<List<Delivery>> totalCompletedDeliveries;

  AgentData({
    required this.agent,
    required this.totalReferralsCounts,
    required this.totalReferral,
    required this.totalActiveReferralsCounts,
    required this.totalActiveReferrals,
    required this.totalIncome,
    required this.totalCompletedDeliveriesCounts,
    required this.totalCompletedDeliveries,
  });

  factory AgentData.fromJson(Map<String, dynamic> json) {
    return AgentData(
        agent: Agent.fromJson(json['agent']),
        totalReferralsCounts: json['totalReferralsCounts'],
        totalReferral: List<Referral>.from(json['totalReferral']
            .map((referralJson) => Referral.fromJson(referralJson))),
        totalActiveReferralsCounts: json['totalActiveReferralsCounts'],
        totalActiveReferrals:
            json['totalActiveReferrals'], // Change the type accordingly
        totalIncome: json['totalIncome'],
        totalCompletedDeliveriesCounts:
            List<int>.from(json['totalCompletedDeliveriesCounts']),
        totalCompletedDeliveries: List<List<Delivery>>.from(
          json['totalCompletedDeliveries'].map((deliveries) =>
              List<Delivery>.from(deliveries
                  .map((deliveryJson) => Delivery.fromJson(deliveryJson)))),
        ));
  }
}

class Agent {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? email;
  String? phone;
  String? state;
  String? profileImage;
  String? profileImageId;
  String? otp;
  String? otpRef;
  bool isVerified;
  bool isCompletedRegistration;
  String? accountNumber;
  String? bankName;
  String? accountName;
  String? paymentOption;
  String? ninImage;
  String? ninImageId;
  String? nin;
  String? role;
  String? month;
  String? year;

  Agent({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.email,
    required this.phone,
    required this.state,
    this.profileImage,
    this.profileImageId,
    this.otp,
    this.otpRef,
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

  factory Agent.fromJson(Map<String?, dynamic> json) {
    return Agent(
      id: json['id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      state: json['state'],
      profileImage: json['profileImage'],
      profileImageId: json['profileImageId'],
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

class Referral {
  String? agentId;
  bool status;
  String? id;
  String? name;
  String? email;
  String? phone;
  bool activeStatus;
  String? createdAt;
  String? updatedAt;
  String? role;
  String? nin;
  int totalReferralBonus;
  int totalSuccessfulDeliveries;
  bool isCompletedRegistration;
  bool isVerified;
  String? lastDelivery;
  String? profileImage;

  Referral({
    required this.agentId,
    required this.status,
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.activeStatus,
    required this.createdAt,
    required this.updatedAt,
    required this.role,
    required this.nin,
    required this.totalReferralBonus,
    required this.totalSuccessfulDeliveries,
    required this.isCompletedRegistration,
    required this.isVerified,
    required this.lastDelivery,
    required this.profileImage,
  });

  factory Referral.fromJson(Map<String?, dynamic> json) {
    return Referral(
      agentId: json['agentId'],
      status: json['status'],
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      activeStatus: json['activeStatus'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      role: json['role'],
      nin: json['nin'],
      totalReferralBonus: json['totalReferralBonus'],
      totalSuccessfulDeliveries: json['totalSuccessfulDeliveries'],
      isCompletedRegistration: json['isCompletedRegistration'],
      isVerified: json['isVerified'],
      lastDelivery: json['lastDelivery'],
      profileImage: json['profileImage'],
    );
  }
}

class Delivery {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? description;
  int size;
  int weight;
  int height;
  int width;
  String? price;
  String? driverPrice;
  bool isDriverPaid;
  String? pickupLat;
  String? pickupLon;
  String? pickupAddress;
  PickupObject? pickupObject;
  String? dropoffLat;
  String? dropoffLon;
  String? dropoffAddress;
  String? scheduledDate;
  String? scheduledTime;
  bool isScheduled;
  ScheduleObject? scheduleObject;
  String? distance;
  String? duration;
  String? userId;
  String? paymentStatus;
  String? status;
  String? acceptedDriverId;
  List<dynamic> rejectedDriverId;
  List<dynamic> awaitingDriverId;
  String? month;
  String? year;

  Delivery({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.description,
    required this.size,
    required this.weight,
    required this.height,
    required this.width,
    required this.price,
    required this.driverPrice,
    required this.isDriverPaid,
    required this.pickupLat,
    required this.pickupLon,
    required this.pickupAddress,
    this.pickupObject,
    required this.dropoffLat,
    required this.dropoffLon,
    required this.dropoffAddress,
    required this.scheduledDate,
    required this.scheduledTime,
    required this.isScheduled,
    this.scheduleObject,
    required this.distance,
    required this.duration,
    required this.userId,
    required this.paymentStatus,
    required this.status,
    required this.acceptedDriverId,
    required this.rejectedDriverId,
    required this.awaitingDriverId,
    required this.month,
    required this.year,
  });

  factory Delivery.fromJson(Map<String, dynamic> json) {
    return Delivery(
      id: json['id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      name: json['name'],
      description: json['description'],
      size: json['size'],
      weight: json['weight'],
      height: json['height'],
      width: json['width'],
      price: json['price'],
      driverPrice: json['driverPrice'],
      isDriverPaid: json['isDriverPaid'],
      pickupLat: json['pickup_lat'],
      pickupLon: json['pickup_lon'],
      pickupAddress: json['pickup_address'],
      pickupObject: json['pickup_object'] != null
          ? PickupObject.fromJson(json['pickup_object'])
          : null,
      dropoffLat: json['dropoff_lat'],
      dropoffLon: json['dropoff_lon'],
      dropoffAddress: json['dropoff_address'],
      scheduledDate: json['scheduled_date'],
      scheduledTime: json['scheduled_time'],
      isScheduled: json['isScheduled'],
      scheduleObject: json['schedule_object'],
      distance: json['distance'],
      duration: json['duration'],
      userId: json['userId'],
      paymentStatus: json['paymentStatus'],
      status: json['status'],
      acceptedDriverId: json['acceptedDriverId'],
      rejectedDriverId: json['rejectedDriverId'],
      awaitingDriverId: json['awaitingDriverId'],
      month: json['month'],
      year: json['year'],
    );
  }
}
