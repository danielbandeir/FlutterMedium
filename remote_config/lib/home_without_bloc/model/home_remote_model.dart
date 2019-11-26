class HomeRemote {
  String example;
  int example2;

  HomeRemote({this.example, this.example2});

  HomeRemote.fromJson(Map<String, dynamic> json) {
    example = json['example'];
    example2 = json['example2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['example'] = this.example;
    data['example2'] = this.example2;
    return data;
  }
}