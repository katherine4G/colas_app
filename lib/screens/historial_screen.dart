//lib/screens/historial_screen.dart
import 'package:flutter/material.dart';
import '../model/turno_model.dart';

class HistorialScreen extends StatelessWidget {
  final List<Turno> historial;
  const HistorialScreen({super.key, required this.historial});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Historial de Atención")),
      body: historial.isEmpty
          ? const Center(child: Text("Aún no se han procesado turnos."))
          : ListView.builder(
              itemCount: historial.length,
              itemBuilder: (context, index) {
                final item = historial[index];
                return ListTile(
                  leading: const Icon(Icons.check_circle, color: Colors.green),
                  title: Text(item.nombre),
                  subtitle: Text("Ticket #${item.id}"),
                  trailing: const Text(
                    "Atendido",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                );
              },
            ),
    );
  }
}
