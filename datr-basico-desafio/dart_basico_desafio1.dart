void main(List<String> args) {
  var pacientes = [
    'Rodrigo Rahman|35|desenvolvedor|SP',
    'Manoel Silva|12|estudante|MG',
    'Joaquim Rahman|18|estudante|SP',
    'Fernando Verne|35|estudante|MG',
    'Gustavo Silva|40|estudante|MG',
    'Sandra Silva|40|estudante|MG',
    'Regina Verne|35|estudante|MG',
    'João Rahman|55|Jornalista|SP',
  ];

  List<String> familias = [];
  List<String> pacientesLista = [];

  int pacienteMais20Anos = 0;

  for (var item in pacientes) {
    var arrayPaciente = item.split('|');
    String nome = arrayPaciente[0];
    int idade = int.parse(arrayPaciente[1]);
    var familia = nome.split(' ')[1];
    pacientesLista.add(nome);

    if (!familias.toString().contains(familia)) {
      familias.add(familia.toString());
    }

    if (idade >= 20) {
      pacienteMais20Anos++;
    }
  }

  // Baseado no array acima monte um relatório onde mostre
  // Apresente a quantidade de pacientes com mais de 20 anos
  print("Paciente com mais de 20 anos: $pacienteMais20Anos");
  // Agrupar os pacientes por familia(considerar o sobrenome) apresentar por familia.
  for (var familia in familias) {
    print('FAMÍLIA : ${familia.toUpperCase()}');
    for (var paciente in pacientesLista) {
      if (paciente.toString().contains(familia)) {
        print('  -  : $paciente');
      }
    }
  }
}
