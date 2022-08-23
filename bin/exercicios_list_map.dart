import 'dart:io';

final listaDeCidades = <Map<String, dynamic>>[];

void main(List<String> arguments) {
  String option;

  do {
    mostrarMenu();
    option = stdin.readLineSync()!;

    switch (option) {
      case '1':
        final nome = receberStringDoUsuario("digite o nome: ");

        final estado = receberStringDoUsuario("digite o estado: ");

        final regiao = receberStringDoUsuario("digite o regiao");

        final area = receberStringDoUsuario("digite a area");

        final populacao = receberStringDoUsuario("digite a populacao");

        adicionarCidade(
          populacao: double.parse(populacao),
          estado: estado,
          nome: nome,
          area: double.parse(area),
          regiao: regiao,
        );

        break;
      case '2':
        mostrarCidades();

        final indice = receberIntDoUsuario(
          "digite o indice da cidade que deseja remover",
        );

        removerCidade(indice - 1);

        break;

      case '3':
        mostrarCidades();

        final indice = receberIntDoUsuario(
          "digite o indice da cidade que deseja editar",
        );

        editarCidade(indice - 1);

        break;

      case '4':
        mostrarCidades();

        final indice = receberIntDoUsuario(
          "digite o indice da cidade que deseja mostrar",
        );

        mostrarCidade(indice - 1);

        break;

      case '0':
        break;
    }
  } while (option != "0");
}

void mostrarMenu() {
  print(
    """
1. adicionar cidade
2. remover cidade
3. editar cidade
4. mostrar cidades

0. sair
""",
  );
}

String receberStringDoUsuario(String messagem) {
  print(messagem);
  final valor = stdin.readLineSync()!;

  return valor;
}

int receberIntDoUsuario(String messagem) {
  print(messagem);
  final valor = stdin.readLineSync()!;

  return int.parse(valor);
}

void mostrarCidades() {
  for (int i = 0; i < listaDeCidades.length; i++) {
    print("${i + 1}) nome da cidade: ${listaDeCidades[i]['nome']}");
  }
}

void mostrarCidade(int indice) {
  if (indice < listaDeCidades.length) {
    print("nome: ${listaDeCidades[indice]['nome']}");
    print("estado: ${listaDeCidades[indice]['estado']}");
    print("regiao: ${listaDeCidades[indice]['regiao']}");
    print("populacao: ${listaDeCidades[indice]['populacao']}");
    print("area: ${listaDeCidades[indice]['area']}");
  } else {
    print("index inválido");
  }
}

void adicionarCidade({
  required String nome,
  required double populacao,
  required String estado,
  required String regiao,
  required double area,
}) {
  final cidade = <String, dynamic>{
    'nome': nome,
    'populacao': populacao,
    'estado': estado,
    'regiao': regiao,
    'area': area,
  };

  listaDeCidades.add(cidade);
}

void removerCidade(int index) {
  if (index < listaDeCidades.length) {
    listaDeCidades.removeAt(index);
  } else {
    print("index inválido");
  }
}

void editarCidade(int indice) {
  mostrarCidade(indice);

  final campo = receberIntDoUsuario(
    "qual campo deseja editar?\n\n1. Nome\n2. Região\n 3. Area\n4. Estado\n 5.Populacao\n",
  );

  switch (campo) {
    case 1:
      final novoNome = receberStringDoUsuario("digite o nome");
      listaDeCidades[indice].update('nome', (value) => novoNome);
      break;
    case 2:
      final novoRegiao = receberStringDoUsuario("digite o regiao");
      listaDeCidades[indice].update('regiao', (value) => novoRegiao);
      break;
    case 3:
      final novaArea = receberStringDoUsuario("digite o area");
      listaDeCidades[indice].update('area', (value) => novaArea);
      break;
    case 4:
      final novoEstado = receberStringDoUsuario("digite o estado");
      listaDeCidades[indice].update('estado', (value) => novoEstado);
      break;
    case 5:
      final novaPopulacao = receberStringDoUsuario("digite o populacao");
      listaDeCidades[indice].update('populacao', (value) => novaPopulacao);
      break;
    default:
      print("campo invalido");
      break;
  }

  mostrarCidade(indice);
}
