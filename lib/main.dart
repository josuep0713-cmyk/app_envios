import 'package:flutter/material.dart';

void main() {
  runApp(const EnviosApp());
}

class EnviosApp extends StatelessWidget {
  const EnviosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Envíos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF0B3D2E), // verde oscuro
        scaffoldBackgroundColor: const Color(0xFFF2F2F2),
        fontFamily: 'Roboto',
      ),
      home: const HomeScreen(),
    );
  }
}

// Colores principales de la app (inspirados en el logo)
const Color verdeOscuro = Color(0xFF0B3D2E);
const Color verdeClaro = Color(0xFF4CAF50);

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Lista simple de categorías
  final List<Map<String, dynamic>> categorias = const [
    {'nombre': 'Hogar', 'icono': Icons.chair},
    {'nombre': 'Tecnología', 'icono': Icons.devices},
    {'nombre': 'Moda', 'icono': Icons.checkroom},
    {'nombre': 'Juguetes', 'icono': Icons.toys},
    {'nombre': 'Deportes', 'icono': Icons.sports_soccer},
  ];

  // Lista simple de productos de ejemplo
  final List<Map<String, dynamic>> productos = const [
    {'nombre': 'Audífonos Bluetooth', 'precio': 'L. 450.00', 'color': Color(0xFFDFF5E1)},
    {'nombre': 'Mochila Escolar', 'precio': 'L. 320.00', 'color': Color(0xFFE8F5E9)},
    {'nombre': 'Smartwatch', 'precio': 'L. 890.00', 'color': Color(0xFFDFF5E1)},
    {'nombre': 'Zapatos Deportivos', 'precio': 'L. 650.00', 'color': Color(0xFFE8F5E9)},
    {'nombre': 'Cafetera', 'precio': 'L. 1,200.00', 'color': Color(0xFFDFF5E1)},
    {'nombre': 'Lámpara LED', 'precio': 'L. 210.00', 'color': Color(0xFFE8F5E9)},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          _buildBarraDireccion(),
          _buildBuscador(),
          const SizedBox(height: 12),
          _buildBanner(),
          const SizedBox(height: 16),
          _buildCategorias(),
          const SizedBox(height: 20),
          _buildTituloSeccion('Ofertas del día'),
          _buildListaProductosHorizontal(),
          const SizedBox(height: 20),
          _buildTituloSeccion('Recomendado para ti'),
          _buildGridProductos(),
          const SizedBox(height: 20),
        ],
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  // Barra superior con el logo
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: verdeOscuro,
      elevation: 0,
      titleSpacing: 12,
      title: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.asset(
              'assets/images/logo.jpeg',
              height: 36,
            ),
          ),
          const SizedBox(width: 8),
          const Text(
            'Envíos',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart, color: Colors.white),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.notifications_none, color: Colors.white),
          onPressed: () {},
        ),
      ],
    );
  }

  // Barra de dirección de entrega (simple, como en Amazon)
  Widget _buildBarraDireccion() {
    return Container(
      color: verdeOscuro,
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
      child: Row(
        children: [
          const Icon(Icons.location_on_outlined, color: Colors.white, size: 18),
          const SizedBox(width: 6),
          Expanded(
            child: const Text(
              'Enviar a: El Progreso, Yoro',
              style: const TextStyle(color: Colors.white, fontSize: 13),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Icon(Icons.keyboard_arrow_down, color: Colors.white),
        ],
      ),
    );
  }

  // Barra de búsqueda
  Widget _buildBuscador() {
    return Container(
      color: verdeOscuro,
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 14),
      child: Container(
        height: 42,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          children: [
            const SizedBox(width: 12),
            const Icon(Icons.search, color: Colors.grey),
            const SizedBox(width: 8),
            Expanded(
              child: const Text(
                'Buscar productos...',
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Banner promocional simple
  Widget _buildBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      height: 140,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [verdeClaro, verdeOscuro],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'Grandes ofertas',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6),
          Text(
            'Envío rápido, seguro y confiable',
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
        ],
      ),
    );
  }

  // Fila de categorías
  Widget _buildCategorias() {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: categorias.length,
        itemBuilder: (context, index) {
          final cat = categorias[index];
          return Container(
            width: 75,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: const Color(0xFFE8F5E9),
                  child: Icon(cat['icono'], color: verdeOscuro),
                ),
                const SizedBox(height: 6),
                Text(
                  cat['nombre'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Título de sección reutilizable
  Widget _buildTituloSeccion(String texto) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        texto,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: verdeOscuro,
        ),
      ),
    );
  }

  // Lista horizontal de productos (ofertas)
  Widget _buildListaProductosHorizontal() {
    return SizedBox(
      height: 170,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        itemCount: productos.length,
        itemBuilder: (context, index) {
          final producto = productos[index];
          return _tarjetaProducto(producto, ancho: 130);
        },
      ),
    );
  }

  // Grid de productos recomendados
  Widget _buildGridProductos() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      itemCount: productos.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.78,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        final producto = productos[index];
        return _tarjetaProducto(producto);
      },
    );
  }

  // Tarjeta de producto reutilizable
  Widget _tarjetaProducto(Map<String, dynamic> producto, {double? ancho}) {
    return Container(
      width: ancho,
      margin: EdgeInsets.symmetric(horizontal: ancho != null ? 4 : 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: producto['color'],
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Icon(Icons.image_outlined, color: verdeOscuro, size: 30),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            producto['nombre'],
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12),
          ),
          const SizedBox(height: 2),
          Text(
            producto['precio'],
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: verdeOscuro,
            ),
          ),
        ],
      ),
    );
  }

  // Barra de navegación inferior
  Widget _buildBottomNav() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: verdeOscuro,
      unselectedItemColor: Colors.grey,
      currentIndex: 0,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
        BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Categorías'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Carrito'),
        BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: 'Pedidos'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Cuenta'),
      ],
    );
  }
}
