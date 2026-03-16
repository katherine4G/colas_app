//lib/widgets/lista_espera_item.dart
import 'package:flutter/material.dart';
import '../model/turno_model.dart';

class ListaEsperaItem extends StatelessWidget {
  final Turno item;
  final bool isFront;
  final bool isRear;
  final VoidCallback onCancel;

  const ListaEsperaItem({
    super.key,
    required this.item,
    required this.isFront,
    required this.isRear,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    final hora =
        "${item.horaEntrada.hour}:${item.horaEntrada.minute.toString().padLeft(2, '0')}";

    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: isFront
            ? Colors.blueAccent.withOpacity(0.05)
            : const Color(0xFFF1F3F4),
        borderRadius: BorderRadius.circular(20),
        border: isFront
            ? Border.all(color: Colors.blueAccent.withOpacity(0.3))
            : null,
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: isFront ? Colors.blueAccent : Colors.grey,
            child: Text(
              "${item.id}",
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.nombre,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                "Entrada: $hora",
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.close, color: Colors.redAccent, size: 20),
            onPressed: onCancel,
          ),
        ],
      ),
    );
  }
}
