//lib/widgets/lista_espera_item.dart
import 'package:flutter/material.dart';
import '../model/turno_model.dart';

class ListaEsperaItem extends StatelessWidget {
  final Turno item;
  final bool isFront;
  final bool isRear;

  const ListaEsperaItem({
    super.key,
    required this.item,
    required this.isFront,
    required this.isRear,
  });

  @override
  Widget build(BuildContext context) {
    final String horaFormateada =
        "${item.horaEntrada.hour.toString().padLeft(2, '0')}:"
        "${item.horaEntrada.minute.toString().padLeft(2, '0')}:"
        "${item.horaEntrada.second.toString().padLeft(2, '0')}";

    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 400),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 20 * (1 - value)),
            child: child,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: isFront
              ? Colors.blueAccent.withValues(alpha: 0.05)
              : const Color(0xFFF1F3F4),
          borderRadius: BorderRadius.circular(20),
          border: isFront
              ? Border.all(color: Colors.blueAccent.withValues(alpha: 0.3))
              : null,
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: isFront ? Colors.blueAccent : Colors.grey,
              child: Text(
                "${item.id}",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 15),
            // Agregamos un Column para mostrar Nombre + Hora
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.nombre,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    "Ingreso: $horaFormateada",
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            if (isFront) _buildBadge("FRONT", Colors.blueAccent),
            if (isRear && !isFront) _buildBadge("REAR", Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _buildBadge(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: 10,
        ),
      ),
    );
  }
}
