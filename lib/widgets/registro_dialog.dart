//lib/widgets/registro_dialog.dart
import 'package:flutter/material.dart';

class RegistroDialog extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onConfirm;

  const RegistroDialog({
    super.key,
    required this.controller,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Nuevo Turno"),
      content: TextField(
        controller: controller,
        autofocus: true,
        decoration: const InputDecoration(
          hintText: "Nombre del cliente",
          border: OutlineInputBorder(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancelar"),
        ),
        ElevatedButton(onPressed: onConfirm, child: const Text("Registrar")),
      ],
    );
  }
}
