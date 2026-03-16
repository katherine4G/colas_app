//lib/widgets/turno_actual_card.dart
import 'package:flutter/material.dart';
import '../model/turno_model.dart';

class TurnoActualCard extends StatelessWidget {
  final Turno? turno;

  const TurnoActualCard({super.key, this.turno});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: Colors.blueAccent.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.blueAccent, width: 2),
      ),
      child: Column(
        children: [
          Text(
            "ATENDIENDO AHORA:",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent[700],
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 10),
          // Si no hay turno, mostramos un guion o mensaje
          Text(
            turno?.nombre ?? " ",
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          if (turno != null)
            Text(
              "Ticket #${turno!.id}",
              style: TextStyle(color: Colors.grey[600]),
            ),
        ],
      ),
    );
  }
}
