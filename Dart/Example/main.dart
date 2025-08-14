import 'dart:io';

void main() {
  List<Map<String, dynamic>> productos = [];
  bool continuar = true;

  while (continuar) {
    print("\n===== MENÚ PRINCIPAL =====");
    print("1. Agregar producto");
    print("2. Listar productos");
    print("3. Actualizar producto");
    print("4. Eliminar producto");
    print("5. Salir");
    stdout.write("Seleccione una opción: ");
    String? opcion = stdin.readLineSync();

    switch (opcion) {
      case "1":
        agregarProducto(productos);
        break;

      case "2":
        listarProductos(productos);
        break;

      case "3":
        actualizarProducto(productos);
        break;

      case "4":
        eliminarProducto(productos);
        break;

      case "5":
        print("Saliendo del programa...");
        continuar = false;
        break;

      default:
        print("Opción no válida, intente de nuevo.");
    }
  }
}

void agregarProducto(List<Map<String, dynamic>> productos) {
  stdout.write("Ingrese el nombre del producto: ");
  String? nombre = stdin.readLineSync();
  if (nombre == null || nombre.isEmpty) {
    print("El nombre no puede estar vacío.");
    return;
  }

  stdout.write("Ingrese el precio: ");
  double? precio = double.tryParse(stdin.readLineSync() ?? "");
  if (precio == null || precio <= 0) {
    print("Precio inválido.");
    return;
  }

  stdout.write("Ingrese la cantidad disponible: ");
  int? cantidad = int.tryParse(stdin.readLineSync() ?? "");
  if (cantidad == null || cantidad < 0) {
    print("Cantidad inválida.");
    return;
  }

  productos.add({
    "nombre": nombre,
    "precio": precio,
    "cantidad": cantidad,
  });

  print("Producto agregado con éxito.");
}

void listarProductos(List<Map<String, dynamic>> productos) {
  if (productos.isEmpty) {
    print("No hay productos registrados.");
    return;
  }

  print("\n=== LISTA DE PRODUCTOS ===");
  for (int i = 0; i < productos.length; i++) {
    var p = productos[i];
    print(
        "$i. ${p['nombre']} - \$${p['precio']} - Cantidad: ${p['cantidad']}");
  }
}

void actualizarProducto(List<Map<String, dynamic>> productos) {
  listarProductos(productos);
  if (productos.isEmpty) return;

  stdout.write("Ingrese el número del producto a actualizar: ");
  int? indice = int.tryParse(stdin.readLineSync() ?? "");
  if (indice == null || indice < 0 || indice >= productos.length) {
    print("Índice inválido.");
    return;
  }

  stdout.write("Nuevo nombre (actual: ${productos[indice]['nombre']}): ");
  String? nuevoNombre = stdin.readLineSync();
  if (nuevoNombre != null && nuevoNombre.isNotEmpty) {
    productos[indice]['nombre'] = nuevoNombre;
  }

  stdout.write("Nuevo precio (actual: ${productos[indice]['precio']}): ");
  double? nuevoPrecio = double.tryParse(stdin.readLineSync() ?? "");
  if (nuevoPrecio != null && nuevoPrecio > 0) {
    productos[indice]['precio'] = nuevoPrecio;
  }

  stdout.write("Nueva cantidad (actual: ${productos[indice]['cantidad']}): ");
  int? nuevaCantidad = int.tryParse(stdin.readLineSync() ?? "");
  if (nuevaCantidad != null && nuevaCantidad >= 0) {
    productos[indice]['cantidad'] = nuevaCantidad;
  }

  print("Producto actualizado con éxito.");
}

void eliminarProducto(List<Map<String, dynamic>> productos) {
  listarProductos(productos);
  if (productos.isEmpty) return;

  stdout.write("Ingrese el número del producto a eliminar: ");
  int? indice = int.tryParse(stdin.readLineSync() ?? "");
  if (indice == null || indice < 0 || indice >= productos.length) {
    print("Índice inválido.");
    return;
  }

  productos.removeAt(indice);
  print("Producto eliminado con éxito.");
}
