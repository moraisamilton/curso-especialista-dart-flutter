import 'dart:collection';

void main(List<String> args) {
  var pessoas = [
    'Rodrigo Rahman|35|Masculino',
    'Jose|56|Masculino',
    'Joaquim|84|Masculino',
    'Rodrigo Rahman|35|Masculino',
    'Maria|88|Feminino',
    'Helena|24|Feminino',
    'Leonardo|5|Masculino',
    'Laura Maria|29|Feminino',
    'Joaquim|72|Masculino',
    'Helena|24|Feminino',
    'Guilherme|15|Masculino',
    'Manuela|85|Masculino',
    'Leonardo|5|Masculino',
    'Helena|24|Feminino',
    'Laura|29|Feminino',
  ];

  bool maior18(String ano) {
    try {
      if (int.parse(ano) > 18) {
        return true;
      }
      return false;
    } catch (e) {
      throw e;
    }
  }

  // Baseado na lista acima.
  // 1 - Remover os duplicados
  // 2 - Me mostre a quantidade de pessoas do sexo Masculino e Feminino
  // 3 - Filtrar e deixar a lista somente com pessoas maiores de 18 anos
  //     e mostre a quantidade de pessoas com mais de 18 anos
  // 4 - Encontre a pessoa mais velha.
  print('');
  print('#########  1 - Remover os duplicados  ##############');
  print('');

  SplayTreeSet<String> pessoasUnica = SplayTreeSet<String>();
  pessoas.forEach((p) => pessoasUnica.add(p));
  print(pessoasUnica);

  print('');
  print(
      '#########  2 - Me mostre a quantidade de pessoas do sexo Masculino e Feminino  ##############');
  print('');

  var pessoaSexoMasculino = pessoasUnica.where((p) => p.contains('Masculino'));
  print('Pessoas Sexo Masculino: ${pessoaSexoMasculino.length}');

  print(
      'Pessoas Sexo Feminino: ${pessoasUnica.length - pessoaSexoMasculino.length}');

  print('');
  print(
      '#########  3 - Filtrar e deixar a lista somente com pessoas maiores de 18 anos, e mostre a quantidade de pessoas com mais de 18 anos  ##############');
  print('');

  int pessoasMais18 = 0;
  var listaPessoaMais18 = [];
  for (var p in pessoasUnica) {
    String idade = p.split('|')[1];
    if (maior18(idade)) {
      pessoasMais18++;
      listaPessoaMais18.add(p);
    }
  }
  print('Pessoas com mais de 18 anos: ${pessoasMais18}');
  listaPessoaMais18.forEach((p) => print(p));

  print('');
  print('#########  4 - Encontre a pessoa mais velha ##############');
  print('');

  var listaPessoasUnicaOrdenada = pessoasUnica.toList();
  listaPessoasUnicaOrdenada.sort((n1, n2) =>
      int.parse(n1.split('|')[1]).compareTo(int.parse(n2.split('|')[1])));

  var pessoaMaisVelha = listaPessoasUnicaOrdenada
      .lastWhere((p) => int.parse(p.toString().split('|')[1]) > 0);
  print(pessoaMaisVelha);
}
