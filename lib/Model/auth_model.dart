import 'dart:convert';

Authentication authenticationFromJson(String str) =>
    Authentication.fromJson(json.decode(str));

String authenticationToJson(Authentication data) => json.encode(data.toJson());

class Authentication {

  final String? token;
  final String? fullname;
  final String? emailid;
  final String message;
  final String? statuscode;

  Authentication({
    
    required this.token,
    required this.fullname,
    required this.emailid,
    required this.message,
    required this.statuscode,
  });

  factory Authentication.fromJson(Map<String, dynamic> json) => Authentication(
        token: json["token"],
        fullname: json["full_name"],
        emailid: json["email_id"],
        statuscode: json["status_code"],
        message: json["message"],
     
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "fullname": fullname,
        "emailid": emailid,
        "statuscode": statuscode,
        "message": message,
      
      };
}
