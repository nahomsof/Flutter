class UserProfile {
  String? uid;
  String? name;
  String? pfpURL;

  UserProfile({required this.name, required this.pfpURL, required this.uid});
  UserProfile.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['pfpURL'] = pfpURL;
    data['uid'] = uid;
    return data;
  }
}
