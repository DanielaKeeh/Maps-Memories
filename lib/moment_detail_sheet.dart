import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'moment.dart';

const Color olivine = Color(0xFF9BAD50);
const Color columbia = Color(0xFFB6CFE4);
const Color vanDyke = Color(0xFF393027);

void showMomentDetail(BuildContext context, Moment moment) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: columbia,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                height: 200,
                width: double.infinity,
                color: columbia.withValues(alpha: 0.3),
                child: const Icon(Icons.image, size: 60, color: vanDyke),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              moment.texto,
              style: GoogleFonts.sniglet(
                fontSize: 18,
                color: vanDyke,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '${moment.fecha.day}/${moment.fecha.month}/${moment.fecha.year}',
              style: GoogleFonts.sniglet(
                fontSize: 14,
                color: vanDyke.withValues(alpha: 0.6),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      );
    },
  );
}
