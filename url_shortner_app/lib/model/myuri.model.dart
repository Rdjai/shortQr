class MyUri {
  String? sId;
  String? title;
  String? originalUrl;
  String? shortId;
  String? createdBy;
  String? createdAt;
  List<Visitehistory>? visitehistory;
  String? updatedAt;
  int? iV;

  MyUri({
    this.sId,
    this.title,
    this.originalUrl,
    this.shortId,
    this.createdBy,
    this.createdAt,
    this.visitehistory,
    this.updatedAt,
    this.iV,
  });

  MyUri.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    originalUrl = json['originalUrl'];
    shortId = json['shortId'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    if (json['visitehistory'] != null) {
      visitehistory = <Visitehistory>[];
      json['visitehistory'].forEach((v) {
        visitehistory!.add(new Visitehistory.fromJson(v));
      });
    }
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['originalUrl'] = this.originalUrl;
    data['shortId'] = this.shortId;
    data['createdBy'] = this.createdBy;
    data['createdAt'] = this.createdAt;
    if (this.visitehistory != null) {
      data['visitehistory'] =
          this.visitehistory!.map((v) => v.toJson()).toList();
    }
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Visitehistory {
  int? timestamps;
  String? ipAddress;
  String? userAgent;
  String? sId;

  Visitehistory({this.timestamps, this.ipAddress, this.userAgent, this.sId});

  Visitehistory.fromJson(Map<String, dynamic> json) {
    timestamps = json['timestamps'];
    ipAddress = json['ipAddress'];
    userAgent = json['userAgent'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timestamps'] = this.timestamps;
    data['ipAddress'] = this.ipAddress;
    data['userAgent'] = this.userAgent;
    data['_id'] = this.sId;
    return data;
  }
}
