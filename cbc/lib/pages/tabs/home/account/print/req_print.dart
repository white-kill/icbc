
import 'dart:convert';

ReqPrint reqPrintFromJson(String str) => ReqPrint.fromJson(json.decode(str));

String reqPrintToJson(ReqPrint data) => json.encode(data.toJson());

class ReqPrint {
    ReqPrint({
        this.detailType = '',
        this.showType = '',
        this.currency = '',
        this.beginTime = '',
        this.endTime = '',
        this.email = '',
        this.method = '',
    });

    String beginTime = '';
    String endTime = '';
    String currency = '';
    String detailType = '';
    String email = '';
    String showType = '';
    String method = '';


    factory ReqPrint.fromJson(Map<String, dynamic> json) => ReqPrint(
        detailType: json["detailType"],
        showType: json["showType"],
        currency: json["currency"],
        beginTime: json["beginTime"],
        endTime: json["endTime"],
        email: json["email"],
        method: json["method"],
    );

    Map<String, dynamic> toJson() => {
        "detailType": detailType,
        "showType": showType,
        "currency": currency,
        "beginTime": beginTime,
        "endTime": endTime,
        "email": email,
        "method": method,
    };
}
