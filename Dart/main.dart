import 'dart:io';
import 'dart:math';

void main() {
  print("Menu: \n 1). MRU \n 2). Promedio de notas \n 3). Puntuacion de equipo de futbol \n 4). Planilla de empleado \n 5). Calculo de hipotenusa \n 6). Conversion de temperatura");
  int? option = int.tryParse(stdin.readLineSync()!);

  switch (option) {
    case 1:
      print("Ingrese la velocidad del vehiculo en Mt/s");
      double? v = double.tryParse(stdin.readLineSync()!);
      print("Ingrese el tiempo estimado en Sg");
      double? t = double.tryParse(stdin.readLineSync()!);
      print("Distancia recorrida: ${MRU(v, t)?.toStringAsFixed(2)} Mt");
      break;
    case 2:
      List<double> listNotes = [];
      int i = 1;
      while (true) {
        print("Ingrese su nota #${i} (o presione Enter para terminar):");
        String? input = stdin.readLineSync();

        if (input == null || input.isEmpty) {
          break;
        }

        double? note = double.tryParse(input);
        if (note != null) {
          listNotes.add(note);
          i++;
        } else {
          print("Entrada inválida. Por favor, ingrese un número.");
        }
      }
      print("El promedio de las notas es: ${PROM(listNotes).toStringAsFixed(2)}");
      break;
    case 3:
      print("Ingrese la cantidad de partidos ganados:");
      int? partidosGanados = int.tryParse(stdin.readLineSync()!);
      print("Ingrese la cantidad de partidos empatados:");
      int? partidosEmpatados = int.tryParse(stdin.readLineSync()!);
      print("Ingrese la cantidad de partidos perdidos:");
      int? partidosPerdidos = int.tryParse(stdin.readLineSync()!);

      puntuacionFutbol(partidosGanados, partidosEmpatados, partidosPerdidos);
      break;
    case 4:
      print("Ingrese el nombre del empleado:");
      String? nombreEmpleado = stdin.readLineSync();
      print("Ingrese la cantidad de horas laboradas en el mes:");
      double? horasLaboradas = double.tryParse(stdin.readLineSync()!);
      print("Ingrese la tarifa por hora:");
      double? tarifaHora = double.tryParse(stdin.readLineSync()!);

      planillaEmpleado(nombreEmpleado, horasLaboradas, tarifaHora);
      break;
    case 5:
      print("Ingrese la longitud del cateto a:");
      double? catetoA = double.tryParse(stdin.readLineSync()!);
      print("Ingrese la longitud del cateto b:");
      double? catetoB = double.tryParse(stdin.readLineSync()!);

      hipotenusaTriangulo(catetoA, catetoB);
      break;
    case 6:
      double? temperaturaCelsius = 70.0;
      double temperaturaFahrenheit = celsiusToFahrenheit(temperaturaCelsius);
      print("${temperaturaCelsius.toStringAsFixed(2)}°C es equivalente a ${temperaturaFahrenheit.toStringAsFixed(2)}°F");
      break;
    default:
      print("Opción no válida.");
  }
}

// Funciones originales
double? MRU(double? v, double? t) {
  double result = 0;
  if (v == null || t == null) {
    print("Ingrese por favor los datos solicitados");
    return null;
  }
  result = v * t;
  return result;
}

double PROM(List<double> notes) {
  double prom = 0;
  double sum = 0;

  if (notes.isEmpty) {
    return 0;
  }
  notes.forEach((note) {
    sum += note;
  });
  prom = sum / notes.length;
  return prom;
}

// Funciones para los nuevos ejercicios

// Ejercicio 3: Puntuación de equipo de fútbol
void puntuacionFutbol(int? ganados, int? empatados, int? perdidos) {
  if (ganados == null || empatados == null || perdidos == null) {
    print("Por favor, ingrese todos los datos solicitados.");
    return;
  }
  int puntosGanados = ganados * 3;
  int puntosEmpatados = empatados * 1;
  int puntosPerdidos = perdidos * 0;
  int puntajeTotal = puntosGanados + puntosEmpatados + puntosPerdidos;

  print("\n--- Resumen del Equipo ---");
  print("Partidos ganados: $ganados");
  print("Partidos empatados: $empatados");
  print("Partidos perdidos: $perdidos");
  print("Puntaje total: $puntajeTotal puntos");
}

// Ejercicio 4: Planilla de empleado
void planillaEmpleado(String? nombre, double? horas, double? tarifa) {
  if (nombre == null || nombre.isEmpty || horas == null || tarifa == null) {
    print("Por favor, ingrese todos los datos solicitados.");
    return;
  }
  double totalDevengado = horas * tarifa;
  print("\n--- Planilla de Pago ---");
  print("Nombre del empleado: $nombre");
  print("Horas laboradas: ${horas.toStringAsFixed(2)}");
  print("Total devengado: \$${totalDevengado.toStringAsFixed(2)}");
}

// Ejercicio 5: Cálculo de hipotenusa
void hipotenusaTriangulo(double? a, double? b) {
  if (a == null || b == null) {
    print("Por favor, ingrese las longitudes de los dos catetos.");
    return;
  }
  // La función 'pow' devuelve un 'num', por lo que convertimos a 'double' para 'sqrt'.
  double hipotenusa = sqrt(pow(a, 2) + pow(b, 2));
  print("\n--- Cálculo de la Hipotenusa ---");
  print("Cateto a: ${a.toStringAsFixed(2)}");
  print("Cateto b: ${b.toStringAsFixed(2)}");
  print("La hipotenusa es: ${hipotenusa.toStringAsFixed(2)}");
}

// Ejercicio 6: Conversión de temperatura
double celsiusToFahrenheit(double? celsius) {
  if (celsius == null) {
    print("Temperatura inválida.");
    return 0.0;
  }
  return (celsius * 1.8) + 32;
}