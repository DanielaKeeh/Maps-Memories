import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'models/memory.dart';
import 'theme/app_colors.dart';

void showMomentDetail(BuildContext context, Memory memory) {
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
                  color: AppColors.columbia,
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
                color: AppColors.columbia.withValues(alpha: 0.3),
                child: const Icon(Icons.image, size: 60, color: AppColors.vanDyke),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              memory.title,
              style: GoogleFonts.sniglet(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.vanDyke,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              memory.description,
              style: GoogleFonts.sniglet(
                fontSize: 18,
                color: AppColors.vanDyke,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '${memory.date.day}/${memory.date.month}/${memory.date.year}',
              style: GoogleFonts.sniglet(
                fontSize: 14,
                color: AppColors.vanDyke.withValues(alpha: 0.6),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      );
    },
  );
}
