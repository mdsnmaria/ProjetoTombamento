class Model {
  String? login;
  String? senha;


  Model({this.login, this.senha});

  Model.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    senha = json['senha'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login'] = this.login;
    data['senha'] = this.senha;
    return data;
  }
}