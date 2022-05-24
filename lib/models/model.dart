class Model {
  String? nome;
  String? descricao;
  String? setor;
  String? responsavel;

  Model({this.nome, this.descricao, this.setor, this.responsavel});

  Model.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    descricao = json['descricao'];
    setor = json['setor'];
    responsavel = json['responsavel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['descricao'] = this.descricao;
    data['setor'] = this.setor;
    data['responsavel'] = this.responsavel;
    return data;
  }
}