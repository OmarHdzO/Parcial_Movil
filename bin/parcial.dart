import 'dart:io';

class Producto {
  String nombre;
  double precio;
  DateTime fechaVencimiento;
  Producto(this.nombre, this.precio, this.fechaVencimiento);
}

class Ventas {
  List<Producto> productos;

  Ventas() : productos = [] {
    //constructor
  }

  void agregarProducto(Producto producto) {
    this.productos.add(producto);
  }

  double obtenerTotal() {
    double total = 0.0;
    for (Producto producto in this.productos) {
      if (producto.fechaVencimiento.difference(DateTime.now()).inDays <= 15) {
        total += producto.precio * 0.85;
      } else {
        total += producto.precio;
      }
    }
    return total;
  }
  
}



void main() {
  Ventas ventas = Ventas();


  print("Ingrese el nombre del producto 1: ");
  String nombreProducto1 = stdin.readLineSync()!;
  print("Ingrese el precio del producto 1: ");
  double precioProducto1 = double.parse(stdin.readLineSync()!);
  print("Ingrese la fecha de vencimiento del producto 1 (YYYY-MM-DD): ");
  String fechaVencimientoProducto1 = stdin.readLineSync()!;

  Producto producto1 = Producto(nombreProducto1, precioProducto1, DateTime.parse(fechaVencimientoProducto1));

/*
  print("Ingrese el nombre del producto 2: ");
  String nombreProducto2 = stdin.readLineSync()!;
  print("Ingrese el precio del producto 2: ");
  double precioProducto2 = double.parse(stdin.readLineSync()!);
  print("Ingrese la fecha de vencimiento del producto 2 (YYYY-MM-DD): ");
  String fechaVencimientoProducto2 = stdin.readLineSync()!;

  Producto producto2 = Producto(nombreProducto2, precioProducto2, DateTime.parse(fechaVencimientoProducto2));
*/

  ventas.agregarProducto(producto1);
  //ventas.agregarProducto(producto2);


  double total = ventas.obtenerTotal();

  print("El total es: $total");
}
