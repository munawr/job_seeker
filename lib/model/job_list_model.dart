class JobsListModel {
  Response? response;
  String? result;
  bool? showMessage;
  int? status;

  JobsListModel({this.response, this.result, this.showMessage, this.status});

  JobsListModel.fromJson(Map<String, dynamic> json) {
    response = json['response'] != null
        ? new Response.fromJson(json['response'])
        : null;
    result = json['result'];
    showMessage = json['show_message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (response != null) {
      data['response'] = response!.toJson();
    }
    data['result'] = result;
    data['show_message'] = showMessage;
    data['status'] = status;
    return data;
  }
}

class Response {
  Details? details;

  Response({this.details});

  Response.fromJson(Map<String, dynamic> json) {
    details =
        json['details'] != null ? new Details.fromJson(json['details']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (details != null) {
      data['details'] = details!.toJson();
    }
    return data;
  }
}

class Details {
  List<Content>? content;

  Details({this.content});

  Details.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      content = <Content>[];
      json['content'].forEach((v) {
        content!.add(new Content.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (content != null) {
      data['content'] = content!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Content {
  int? id;
  List<String>? jobTypes;
  List<WorkingDays>? workingDays;
  List<String>? skills;
  Employer? employer;
  Staff? staff;
  JobLocation? jobLocation;
  String? jobCode;
  String? activationStatus;
  String? title;
  String? titleAlt;
  String? description;
  String? lastDateToApply;
  String? locationOption;
  String? jobTag;
  int? noOfVaccancies;
  String? postedOn;
  int? postedAt;
  int? minSalary;
  int? maxSalary;
  String? salaryCycle;
  String? timingFrom;
  String? timingTo;
  bool? status;
  String? url;
  bool? experienceRequired;
  int? experienceFrom;
  int? experienceTo;
  String? experienceType;
  String? startDate;
  String? joiningTime;
  bool? applyFlag;
  bool? savedFlag;
  int? appliedCount;
  int? interestedJobCount;
  int? acceptedCount;
  int? rejectedCount;
  bool? salaryNegotiable;
  Null? reasonRejected;
  Null? reasonUncleared;
  String? reasonDeactivated;
  int? totalApplicantCount;
  Null? reasonChecksRejected;
  List<String>? reasonChecksDeactivated;
  Null? reasonChecksUncleared;
  String? createdAt;
  String? updatedAt;
  String? district;
  String? jobCategory;

  Content(
      {this.id,
      this.jobTypes,
      this.workingDays,
      this.skills,
      this.employer,
      this.staff,
      this.jobLocation,
      this.jobCode,
      this.activationStatus,
      this.title,
      this.titleAlt,
      this.description,
      this.lastDateToApply,
      this.locationOption,
      this.jobTag,
      this.noOfVaccancies,
      this.postedOn,
      this.postedAt,
      this.minSalary,
      this.maxSalary,
      this.salaryCycle,
      this.timingFrom,
      this.timingTo,
      this.status,
      this.url,
      this.experienceRequired,
      this.experienceFrom,
      this.experienceTo,
      this.experienceType,
      this.startDate,
      this.joiningTime,
      this.applyFlag,
      this.savedFlag,
      this.appliedCount,
      this.interestedJobCount,
      this.acceptedCount,
      this.rejectedCount,
      this.salaryNegotiable,
      this.reasonRejected,
      this.reasonUncleared,
      this.reasonDeactivated,
      this.totalApplicantCount,
      this.reasonChecksRejected,
      this.reasonChecksDeactivated,
      this.reasonChecksUncleared,
      this.createdAt,
      this.updatedAt,
      this.district,
      this.jobCategory});

  Content.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jobTypes = json['jobTypes'].cast<String>();
    if (json['workingDays'] != null) {
      workingDays = <WorkingDays>[];
      json['workingDays'].forEach((v) {
        workingDays!.add(new WorkingDays.fromJson(v));
      });
    }
    skills = json['skills'].cast<String>();
    employer = json['employer'] != null
        ? new Employer.fromJson(json['employer'])
        : null;
    staff = json['staff'] != null ? new Staff.fromJson(json['staff']) : null;
    jobLocation = json['jobLocation'] != null
        ? new JobLocation.fromJson(json['jobLocation'])
        : null;
    jobCode = json['jobCode'];
    activationStatus = json['activation_status'];
    title = json['title'];
    titleAlt = json['title_alt'];
    description = json['description'];
    lastDateToApply = json['lastDateToApply'];
    locationOption = json['locationOption'];
    jobTag = json['jobTag'];
    noOfVaccancies = json['noOfVaccancies'];
    postedOn = json['postedOn'];
    postedAt = json['postedAt'];
    minSalary = json['minSalary'];
    maxSalary = json['maxSalary'];
    salaryCycle = json['salary_cycle'];
    timingFrom = json['timingFrom'];
    timingTo = json['timingTo'];
    status = json['status'];
    url = json['url'];
    experienceRequired = json['experienceRequired'];
    experienceFrom = json['experienceFrom'];
    experienceTo = json['experienceTo'];
    experienceType = json['experienceType'];
    startDate = json['startDate'];
    joiningTime = json['joiningTime'];
    applyFlag = json['applyFlag'];
    savedFlag = json['savedFlag'];
    appliedCount = json['appliedCount'];
    interestedJobCount = json['interestedJobCount'];
    acceptedCount = json['acceptedCount'];
    rejectedCount = json['rejectedCount'];
    salaryNegotiable = json['salaryNegotiable'];
    reasonRejected = json['reason_rejected'];
    reasonUncleared = json['reason_uncleared'];
    reasonDeactivated = json['reason_deactivated'];
    totalApplicantCount = json['totalApplicantCount'];
    reasonChecksRejected = json['reason_checks_rejected'];
    reasonChecksUncleared = json['reason_checks_uncleared'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    district = json['district'];
    jobCategory = json['jobCategory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['jobTypes'] = jobTypes;
    if (workingDays != null) {
      data['workingDays'] = workingDays!.map((v) => v.toJson()).toList();
    }
    data['skills'] = skills;
    if (employer != null) {
      data['employer'] = employer!.toJson();
    }
    if (staff != null) {
      data['staff'] = staff!.toJson();
    }
    if (jobLocation != null) {
      data['jobLocation'] = jobLocation!.toJson();
    }
    data['jobCode'] = jobCode;
    data['activation_status'] = activationStatus;
    data['title'] = title;
    data['title_alt'] = titleAlt;
    data['description'] = description;
    data['lastDateToApply'] = lastDateToApply;
    data['locationOption'] = locationOption;
    data['jobTag'] = jobTag;
    data['noOfVaccancies'] = noOfVaccancies;
    data['postedOn'] = postedOn;
    data['postedAt'] = postedAt;
    data['minSalary'] = minSalary;
    data['maxSalary'] = maxSalary;
    data['salary_cycle'] = salaryCycle;
    data['timingFrom'] = timingFrom;
    data['timingTo'] = timingTo;
    data['status'] = status;
    data['url'] = url;
    data['experienceRequired'] = experienceRequired;
    data['experienceFrom'] = experienceFrom;
    data['experienceTo'] = experienceTo;
    data['experienceType'] = experienceType;
    data['startDate'] = startDate;
    data['joiningTime'] = joiningTime;
    data['applyFlag'] = applyFlag;
    data['savedFlag'] = savedFlag;
    data['appliedCount'] = appliedCount;
    data['interestedJobCount'] = interestedJobCount;
    data['acceptedCount'] = acceptedCount;
    data['rejectedCount'] = rejectedCount;
    data['salaryNegotiable'] = salaryNegotiable;
    data['reason_rejected'] = reasonRejected;
    data['reason_uncleared'] = reasonUncleared;
    data['reason_deactivated'] = reasonDeactivated;
    data['totalApplicantCount'] = totalApplicantCount;
    data['reason_checks_rejected'] = reasonChecksRejected;
    data['reason_checks_deactivated'] = reasonChecksDeactivated;
    data['reason_checks_uncleared'] = reasonChecksUncleared;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['district'] = district;
    data['jobCategory'] = jobCategory;
    return data;
  }
}

class WorkingDays {
  String? name;
  int? id;

  WorkingDays({this.name, this.id});

  WorkingDays.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['id'] = id;
    return data;
  }
}

class Employer {
  int? id;
  String? code;
  String? name;
  String? pin;
  String? contact;
  String? altContact;
  String? email;
  String? regNumber;
  String? employerType;
  String? url;
  bool? status;
  String? logo;
  String? createdAt;
  String? updatedAt;
  String? username;
  String? addressLine1;
  String? addressLine2;
  bool? emailVerified;
  bool? contactVerified;
  int? city;
  String? company;

  Employer(
      {this.id,
      this.code,
      this.name,
      this.pin,
      this.contact,
      this.altContact,
      this.email,
      this.regNumber,
      this.employerType,
      this.url,
      this.status,
      this.logo,
      this.createdAt,
      this.updatedAt,
      this.username,
      this.addressLine1,
      this.addressLine2,
      this.emailVerified,
      this.contactVerified,
      this.city,
      this.company});

  Employer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    pin = json['pin'];
    contact = json['contact'];
    altContact = json['alt_contact'];
    email = json['email'];
    regNumber = json['reg_number'];
    employerType = json['employer_type'];
    url = json['url'];
    status = json['status'];
    logo = json['logo'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    username = json['username'];
    addressLine1 = json['addressLine1'];
    addressLine2 = json['addressLine2'];
    emailVerified = json['emailVerified'];
    contactVerified = json['contactVerified'];
    city = json['city'];
    company = json['company'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
    data['pin'] = pin;
    data['contact'] = contact;
    data['alt_contact'] = altContact;
    data['email'] = email;
    data['reg_number'] = regNumber;
    data['employer_type'] = employerType;
    data['url'] = url;
    data['status'] = status;
    data['logo'] = logo;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['username'] = username;
    data['addressLine1'] = addressLine1;
    data['addressLine2'] = addressLine2;
    data['emailVerified'] = emailVerified;
    data['contactVerified'] = contactVerified;
    data['city'] = city;
    data['company'] = company;
    return data;
  }
}

class Staff {
  int? id;
  String? city;
  AccessType? accessType;
  String? fullName;
  String? gender;
  String? photo;
  Null? dob;
  String? code;
  Null? appointedOn;
  Null? position;
  Null? placeOfWork;
  int? approvedCount;
  int? unclearedCount;
  int? rejectedCount;
  String? contact;
  String? email;
  String? address;
  String? pin;
  String? lastActive;
  String? lastLogin;
  bool? live;
  bool? loginEnable;

  Staff(
      {this.id,
      this.city,
      this.accessType,
      this.fullName,
      this.gender,
      this.photo,
      this.dob,
      this.code,
      this.appointedOn,
      this.position,
      this.placeOfWork,
      this.approvedCount,
      this.unclearedCount,
      this.rejectedCount,
      this.contact,
      this.email,
      this.address,
      this.pin,
      this.lastActive,
      this.lastLogin,
      this.live,
      this.loginEnable});

  Staff.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    city = json['city'];
    accessType = json['accessType'] != null
        ? new AccessType.fromJson(json['accessType'])
        : null;
    fullName = json['fullName'];
    gender = json['gender'];
    photo = json['photo'];
    dob = json['dob'];
    code = json['code'];
    appointedOn = json['appointedOn'];
    position = json['position'];
    placeOfWork = json['placeOfWork'];
    approvedCount = json['approvedCount'];
    unclearedCount = json['unclearedCount'];
    rejectedCount = json['rejectedCount'];
    contact = json['contact'];
    email = json['email'];
    address = json['address'];
    pin = json['pin'];
    lastActive = json['lastActive'];
    lastLogin = json['last_login'];
    live = json['live'];
    loginEnable = json['loginEnable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['city'] = city;
    if (accessType != null) {
      data['accessType'] = accessType!.toJson();
    }
    data['fullName'] = fullName;
    data['gender'] = gender;
    data['photo'] = photo;
    data['dob'] = dob;
    data['code'] = code;
    data['appointedOn'] = appointedOn;
    data['position'] = position;
    data['placeOfWork'] = placeOfWork;
    data['approvedCount'] = approvedCount;
    data['unclearedCount'] = unclearedCount;
    data['rejectedCount'] = rejectedCount;
    data['contact'] = contact;
    data['email'] = email;
    data['address'] = address;
    data['pin'] = pin;
    data['lastActive'] = lastActive;
    data['last_login'] = lastLogin;
    data['live'] = live;
    data['loginEnable'] = loginEnable;
    return data;
  }
}

class AccessType {
  int? id;
  List<String>? permissions;
  String? name;

  AccessType({this.id, this.permissions, this.name});

  AccessType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    permissions = json['permissions'].cast<String>();
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['permissions'] = permissions;
    data['name'] = name;
    return data;
  }
}

class JobLocation {
  int? id;
  District? district;
  String? name;
  bool? status;
  bool? popular;
  String? createdAt;
  String? updatedAt;

  JobLocation(
      {this.id,
      this.district,
      this.name,
      this.status,
      this.popular,
      this.createdAt,
      this.updatedAt});

  JobLocation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    district = json['district'] != null
        ? new District.fromJson(json['district'])
        : null;
    name = json['name'];
    status = json['status'];
    popular = json['popular'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    if (district != null) {
      data['district'] = district!.toJson();
    }
    data['name'] = name;
    data['status'] = status;
    data['popular'] = popular;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class District {
  int? id;
  State? state;
  String? name;
  bool? status;
  String? createdAt;
  String? updatedAt;

  District(
      {this.id,
      this.state,
      this.name,
      this.status,
      this.createdAt,
      this.updatedAt});

  District.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    state = json['state'] != null ? new State.fromJson(json['state']) : null;
    name = json['name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    if (state != null) {
      data['state'] = state!.toJson();
    }
    data['name'] = name;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class State {
  int? id;
  String? name;
  bool? status;
  String? createdAt;
  String? updatedAt;

  State({this.id, this.name, this.status, this.createdAt, this.updatedAt});

  State.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
