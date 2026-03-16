//lib/logic/cola_manager.dart
import '../model/turno_model.dart';

class ColaManager {
  final List<Turno> _cola = [];
  final List<Turno> _historial = [];
  Turno? _turnoActual;
  int _contadorId = 1;

  List<Turno> get cola => _cola;
  List<Turno> get historial => _historial;
  Turno? get turnoActual => _turnoActual;

  void registrarTurno(String nombre) {
    if (nombre.trim().isEmpty) return;
    _cola.add(
      Turno(id: _contadorId++, nombre: nombre, horaEntrada: DateTime.now()),
    );
  }

  void atenderSiguiente() {
    if (_cola.isNotEmpty) {
      if (_turnoActual != null) {
        _historial.insert(0, _turnoActual!); // Guardar el anterior
      }
      _turnoActual = _cola.removeAt(0);
    } else {
      if (_turnoActual != null) _historial.insert(0, _turnoActual!);
      _turnoActual = null;
    }
  }

  void reiniciar() {
    _cola.clear();
    _historial.clear();
    _turnoActual = null;
    _contadorId = 1;
  }
}
