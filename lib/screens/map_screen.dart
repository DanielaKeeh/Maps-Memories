import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/memory.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;
  
  // Data mock (Lugares con coordenadas reales para que no se vea vacío)
  final List<Memory> mockedMemories = [
    Memory(
      title: 'Nuestra primera cita',
      description: 'Fuimos a tomar café y pasear por el parque. ¡Estaba súper nervioso!',
      latitude: 19.432608,
      longitude: -99.133209, // Zócalo CDMX
    ),
    Memory(
      title: 'Viaje a la playa',
      description: 'El mejor fin de semana relajándonos frente al mar y viendo el atardecer.',
      latitude: 21.161908, 
      longitude: -86.851528, // Cancún
    ),
    Memory(
      title: 'Cena de Aniversario',
      description: 'Una noche increíble en nuestro restaurante favorito.',
      latitude: 19.4299,
      longitude: -99.1685, // Ángel de la Independencia
    ),
    Memory(
      title: 'Escapada al bosque',
      description: 'Hacía mucho frío pero valió la pena por la vista en la cabaña.',
      latitude: 19.2905,
      longitude: -99.3090, // La Marquesa (aprox)
    )
  ];

  Set<Marker> _createMarkers() {
    return mockedMemories.map((memory) {
      return Marker(
        markerId: MarkerId(memory.id),
        position: LatLng(memory.latitude, memory.longitude),
        onTap: () => _onMarkerTapped(memory),
        // Por ahora usamos el marcador por defecto, luego Persona B lo pondrá custom.
      );
    }).toSet();
  }

  void _onMarkerTapped(Memory memory) {
    // Esto es el Bottom Sheet simple que Persona B luego mejorará.
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                memory.title,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Text(
                memory.description,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Icon(Icons.calendar_today, size: 18, color: Colors.grey),
                  const SizedBox(width: 6),
                  Text(
                    "${memory.date.day}/${memory.date.month}/${memory.date.year}",
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa de nosotros', style: TextStyle(fontWeight: FontWeight.w600)),
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
        initialCameraPosition: const CameraPosition(
          target: LatLng(19.432608, -99.133209), // Centrado inicial
          zoom: 5.0,
        ),
        markers: _createMarkers(),
      ),
    );
  }
}
