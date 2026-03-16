import 'package:flutter/material.dart';
import '../logic/cola_manager.dart';
import '../widgets/turno_actual_card.dart';
import '../widgets/lista_espera_item.dart';
import '../widgets/boton_accion_cola.dart';
import 'registro_screen.dart';
import 'historial_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ColaManager manager = ColaManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text(
          'Turnos digitales',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => HistorialScreen(historial: manager.historial),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => setState(() => manager.reiniciar()),
          ),
        ],
      ),
      body: Column(
        children: [
          TurnoActualCard(turno: manager.turnoActual),

          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                child: manager.cola.isEmpty
                    ? _buildEmptyState()
                    : ListView.separated(
                        padding: const EdgeInsets.all(20),
                        itemCount: manager.cola.length,
                        separatorBuilder: (_, _) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          return ListaEsperaItem(
                            item: manager.cola[index],
                            isFront: index == 0,
                            isRear: index == manager.cola.length - 1,
                          );
                        },
                      ),
              ),
            ),
          ),

          BotonAccionCola(
            onPressed: manager.cola.isEmpty
                ? null
                : () => setState(() => manager.atenderSiguiente()),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () async {
          final nombre = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const RegistroScreen()),
          );
          if (nombre != null && nombre.toString().isNotEmpty) {
            setState(() => manager.registrarTurno(nombre));
          }
        },
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.hourglass_empty_rounded,
            size: 64,
            color: Colors.grey.shade300,
          ),
          const SizedBox(height: 16),
          Text(
            "No hay clientes en espera",
            style: TextStyle(
              color: Colors.grey.shade500,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
