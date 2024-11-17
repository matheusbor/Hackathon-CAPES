class Artigo {
  final String acessoAberto;
  final int anoPublicacao;
  final List<Autor> autoresEInstituicoes;
  final String doi;
  final DateTime dataPublicacao;
  final String idioma;
  final String? licenca;
  final int numeroDeCitacoes;
  final String paginaDeDestino;
  final String titulo;
  final String topicos;

  Artigo({
    required this.acessoAberto,
    required this.anoPublicacao,
    required this.autoresEInstituicoes,
    required this.doi,
    required this.dataPublicacao,
    required this.idioma,
    this.licenca,
    required this.numeroDeCitacoes,
    required this.paginaDeDestino,
    required this.titulo,
    required this.topicos,
  });

  factory Artigo.fromJson(Map<String, dynamic> json) {
    return Artigo(
      acessoAberto: json['Acesso Aberto'],
      anoPublicacao: json['Ano de Publicação'],
      autoresEInstituicoes: (json['Autores e Instituições'] as List).map((autor) => Autor.fromJson(autor)).toList(),
      doi: json['DOI'],
      dataPublicacao: DateTime.parse(json['Data de Publicação']),
      idioma: json['Idioma'],
      licenca: json['Licença'],
      numeroDeCitacoes: json['Número de Citações'],
      paginaDeDestino: json['Página de Destino'],
      titulo: json['Título'],
      topicos: json['Tópicos'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Acesso Aberto': acessoAberto,
      'Ano de Publicação': anoPublicacao,
      'Autores e Instituições': autoresEInstituicoes.map((autor) => autor.toJson()).toList(),
      'DOI': doi,
      'Data de Publicação': dataPublicacao.toIso8601String(),
      'Idioma': idioma,
      'Licença': licenca,
      'Número de Citações': numeroDeCitacoes,
      'Página de Destino': paginaDeDestino,
      'Título': titulo,
      'Tópicos': topicos,
    };
  }
}

class Autor {
  final String nome;
  final String instituicao;

  Autor({
    required this.nome,
    required this.instituicao,
  });

  factory Autor.fromJson(Map<String, dynamic> json) {
    return Autor(
      nome: json['Autor'],
      instituicao: json['Instituições'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Autor': nome,
      'Instituições': instituicao,
    };
  }
}
