import "dart:io";

void main() {
  // Cambiamos la lista para que almacene Mapas.
  // Un Map<String, dynamic> puede tener llaves de texto y valores de cualquier tipo.
  List<Map<String, dynamic>> books = [];
  int pk = 0;
  while (true) {
    print("\n--- Menú de Biblioteca ---");

    print(
      "1) Crear libro\n2) Ver libros\n3) Actualizar libro\n4) Eliminar libro\n5) Salir",
    );
    // Usar tryParse es más seguro para evitar que el programa se caiga.
    int? option = int.tryParse(stdin.readLineSync() ?? '');
    switch (option) {
      case 1:
        pk++;
        print("\n--- Crear Libro ---");

        print("Ingrese el título del libro:");
        String? title = stdin.readLineSync();

        print("Ingrese el autor del libro:");
        String? autor = stdin.readLineSync();

        print("Ingrese el año de publicación:");
        int? year;
        while (year == null) {
          String? yearInput = stdin.readLineSync();
          year = int.tryParse(yearInput ?? '');
          if (year == null) {
            print("Año inválido. Por favor, ingrese un número válido.");
          }
        }

        if (title != null &&
            title.isNotEmpty &&
            autor != null &&
            autor.isNotEmpty) {
          var tempBook = Book(pk: pk, title: title, autor: autor, year: year);
          var bookAsMap = tempBook.Create();
          books.add(bookAsMap);
          print("Libro creado con éxito.");
        } else {
          print("No se pudo crear el libro.");
        }
        continue;
      case 2:
        print("Ver libros");
        if (books.isEmpty) {
          print("Sin libros");
          continue;
        }
        print("Lista de libros:");
        print("ID\tTitle\tAutor\tYear");
        for (var book in books) {
          print(
            "${book["Pk"]}\t${book["Title"]}\t${book["Autor"]}\t${book["Year"]}",
          );
        }
        continue;
      case 3:
        print("Actualizar libro");
        if (books.isEmpty) {
          print("Sin libros");
          continue;
        }
        print("Por favor, ingrese el nombre del libro");
        String? title = stdin.readLineSync();
        var bookUpdated = Book.Update(books, title);
        for (var book in books) {
          if (book["Pk"] == bookUpdated["Pk"]) {
            book["Title"] = bookUpdated["Title"];
            book["Autor"] = bookUpdated["Autor"];
            book["Year"] = bookUpdated["Year"];
            print("Libro actualizado con éxito.");
            break;
          }
        }
        continue;
      case 4:
        print("Eliminar libro");
        print("Por favor, ingrese el nombre del libro");
        String? title = stdin.readLineSync();
        if (books.isEmpty) {
          print("Sin libros");
          continue;
        }
        for (var book in books) {
          if (book["Title"] == title) {
            books.remove(book);
            print("Libro eliminado con éxito.");
            break;
          }
        }
        continue;
      case 5:
        print("Saliendo del programa...");
        exit(0);
      default:
        print("Opción no válida.");
        continue;
    }
  }
}

class Book {
  final int pk;
  String title;
  String autor;
  int year;

  Book({
    required this.pk,
    required this.title,
    required this.autor,
    required this.year,
  });

  // Funcion para retornar un Map del libro
  Map<String, dynamic> Create() {
    return <String, dynamic>{
      "Pk": pk,
      "Title": title,
      "Autor": autor,
      "Year": year,
    };
  }

  static Map<String, dynamic> Search(List<Map<String, dynamic>> books, title) {
    for (var book in books) {
      if (book["Title"] == title) {
        return book;
      }
    }
    throw 'No se encontro el libro';
  }

  static Map<String, dynamic> Update(List<Map<String, dynamic>> books, title) {
    var book = Search(books, title);
    if (book.isEmpty) {
      throw 'No se encontro el libro';
    }

    print("-- // Actualizar libro // --");
    print("Presione enter si no es el dato que va a actualizar");

    print("Titulo : ${book['Title']}");
    String newTitle = stdin.readLineSync() ?? book['Title'];

    print("Autor : ${book['Autor']}");
    String newAutor = stdin.readLineSync() ?? book['Autor'];

    print("Año : ${book['Year']}");
    int? newYear = int.tryParse(stdin.readLineSync() ?? book['Year']);

    book['Pk'] = book['Pk'];
    book['Title'] = newTitle;
    book['Autor'] = newAutor;
    book['Year'] = newYear;

    return book;
  }
}
