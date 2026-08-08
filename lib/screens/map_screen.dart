import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/memory.dart';
import '../moment_detail_sheet.dart';
import '../theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
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
    showMomentDetail(context, memory);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mapa de nosotros',
          style: GoogleFonts.sniglet(fontWeight: FontWeight.w600, color: AppColors.vanDyke),
        ),
        backgroundColor: AppColors.olivine,
        foregroundColor: AppColors.vanDyke,
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
