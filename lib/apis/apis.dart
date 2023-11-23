import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../contants/apis.constan.dart';
import '../controller/secure_storage.dart';

class Apis extends GetxController {
  Future signInDriver({
    required String password,
    required String email,
  }) async {
    final singnInUrl = Uri.parse("${AppApis.endPointV2}auth/signin-agent");
    final response = await http.post(singnInUrl, body: {
      "email": email,
      "password": password,
    });

    return response;
  }

  Future forgotpasswordDrivers({
    required String email,
  }) async {
    final singnInUrl =
        Uri.parse("${AppApis.endPointV2}auth/forgotpassword-agent");
    final response = await http.post(singnInUrl, body: {
      "email": email,
    });

    return response;
  }

  Future restpassword({
    required String email,
    required String password,
  }) async {
    var token = await AStorage.getDriverToken();
    log(token.toString());
    final singnInUrl =
        Uri.parse("${AppApis.endPointV2}auth/resetpassword-agent");
    final response = await http.post(singnInUrl, headers: {
      'Authorization': 'Bearer $token',
    }, body: {
      "email": email,
      "password": password,
    });

    return response;
  }

  static Future signInDriverV2({
    required String phoneNumber,
    required String email,
  }) async {
    final singnInUrl = Uri.parse("${AppApis.endPoint}auth/signin-driver");
    final response = await http.post(singnInUrl, body: {
      "phone": phoneNumber,
      "email": email.toLowerCase(),
    });
    log(response.statusCode.toString());
    log(response.body);
    final data = json.decode(response.body);

    log(data["otp"]['data']['data']['token']);
    String otp = data["otp"]['data']['data']['token'];
    AStorage.saveDriverOtp(otp);
    return response;
  }

  Future verifyOtp({
    required String phoneNumber,
    required String code,
  }) async {
    final verifyOtpUrl = Uri.parse("${AppApis.endPointV2}auth/verify-agent");
    final response = await http.post(verifyOtpUrl, body: {
      "phone": phoneNumber,
      "code": code,
    });

    return response;
  }

  Future getUserDetail() async {
    String? token = await AStorage.getDriverToken();
    final verifyOtpUrl = Uri.parse("${AppApis.endPoint}agent/profile");
    final response = await http.get(
      verifyOtpUrl,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    return response;
  }

  Future getUserHistory() async {
    String? token = await AStorage.getDriverToken();
    final verifyOtpUrl = Uri.parse("${AppApis.endPoint}agent/history");
    final response = await http.get(
      verifyOtpUrl,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    log(response.statusCode.toString());
    log(response.body.toString());
    return response;
  }

  Future editProfile({
    required String name,
    required String email,
    required String accountName,
    required String accountNumber,
    required String bankName,
    required String paymentOption,
  }) async {
    String? token = await AStorage.getDriverToken();
    log(token.toString());
    final updateDriverNameUrl =
        Uri.parse("${AppApis.endPoint}agent/edit-profile");
    final response = await http.post(
      updateDriverNameUrl,
      headers: {
        'Authorization': 'Bearer $token',
      },
      body: {
        "name": name,
        "email": email,
        "accountName": accountName,
        "accountNumber": accountNumber,
        "bankName": bankName,
        "paymentOption": paymentOption
      },
    );
    log(response.body.toString());
    return response;
  }

  Future updateDriverName({
    required String accountName,
    required String accountNumber,
    required String bankName,
    required String paymentOption,
  }) async {
    String? token = await AStorage.getDriverToken();
    log(token.toString());
    final updateDriverNameUrl =
        Uri.parse("${AppApis.endPointV2}auth/update-profile-agent");
    final response = await http.post(
      updateDriverNameUrl,
      headers: {
        'Authorization': 'Bearer $token',
      },
      body: {
        "accountName": accountName,
        "accountNumber": accountNumber,
        "bankName": bankName,
        "paymentOption": paymentOption,
      },
    );
    return response;
  }

  Future createUser({
    required String password,
    required String phoneNumber,
    required String email,
    required String fullname,
    required String nin,
    required File ninImage,
  }) async {
    // String token = await AStorage.getDriverToken();
    // log("the tokon is $token");

    final url = Uri.parse("${AppApis.endPointV2}auth/signup-agent");
    final response = http.MultipartRequest("POST", url);
    // response.headers.addAll({'Authorization': 'Bearer $token'});
    response.fields["nin"] = nin;
    response.fields["name"] = fullname;
    response.fields["phone"] = phoneNumber;
    response.fields["email"] = email;
    response.fields["password"] = password;
    var nImage = await http.MultipartFile.fromPath("ninImage", ninImage.path);

    response.files.addAll([
      nImage,
    ]);
    final result = await response.send();
    // final resultData = await result.stream.toBytes();
    // final data = String.fromCharCodes(resultData);

    // AStorage.saveCompleteData(data);
    // log(data);

    return result;
  }

  Future uploadProfile({
    required File ninImage,
  }) async {
    String? token = await AStorage.getDriverToken();
    log("the tokon is $token");

    final url = Uri.parse("${AppApis.endPoint}agent/upload-profile-image");
    final response = http.MultipartRequest("POST", url);
    response.headers.addAll({'Authorization': 'Bearer $token'});

    var nImage =
        await http.MultipartFile.fromPath("profileImage", ninImage.path);

    response.files.add(
      nImage,
    );
    final result = await response.send();
    // final resultData = await result.stream.toBytes();
    // final data = String.fromCharCodes(resultData);

    // AStorage.saveCompleteData(data);
    // log(data);

    return result;
  }

  Future updateTokenDrivers({
    required String token,
  }) async {
    String? apiToken = await AStorage.getDriverToken();
    final singnInUrl =
        Uri.parse("${AppApis.endPoint}agent/update-firebase-token");
    final response = await http.post(singnInUrl, headers: {
      'Authorization': 'Bearer $apiToken',
    }, body: {
      "token": token,
    });

    print(response.body);

    if (response.statusCode == 201) {
      final data = json.decode(response.body);

      return response;
    } else {
      return response;
    }
  }
}
