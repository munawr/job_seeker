class StatesListModel {
  Response? _response;
  String? _result;
  bool? _showMessage;
  int? _status;

  StatesListModel(
      {Response? response, String? result, bool? showMessage, int? status}) {
    if (response != null) {
      this._response = response;
    }
    if (result != null) {
      this._result = result;
    }
    if (showMessage != null) {
      this._showMessage = showMessage;
    }
    if (status != null) {
      this._status = status;
    }
  }

  Response? get response => _response;
  set response(Response? response) => _response = response;
  String? get result => _result;
  set result(String? result) => _result = result;
  bool? get showMessage => _showMessage;
  set showMessage(bool? showMessage) => _showMessage = showMessage;
  int? get status => _status;
  set status(int? status) => _status = status;

  StatesListModel.fromJson(Map<String, dynamic> json) {
    _response = json['response'] != null
        ? new Response.fromJson(json['response'])
        : null;
    _result = json['result'];
    _showMessage = json['show_message'];
    _status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._response != null) {
      data['response'] = this._response!.toJson();
    }
    data['result'] = this._result;
    data['show_message'] = this._showMessage;
    data['status'] = this._status;
    return data;
  }
}

class Response {
  List<Details>? _details;

  Response({List<Details>? details}) {
    if (details != null) {
      this._details = details;
    }
  }

  List<Details>? get details => _details;
  set details(List<Details>? details) => _details = details;

  Response.fromJson(Map<String, dynamic> json) {
    if (json['details'] != null) {
      _details = <Details>[];
      json['details'].forEach((v) {
        _details!.add(new Details.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._details != null) {
      data['details'] = this._details!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Details {
  int? _id;
  String? _name;
  bool? _status;
  String? _createdAt;
  String? _updatedAt;

  Details(
      {int? id,
      String? name,
      bool? status,
      String? createdAt,
      String? updatedAt}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (status != null) {
      this._status = status;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  bool? get status => _status;
  set status(bool? status) => _status = status;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  Details.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['status'] = this._status;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}
