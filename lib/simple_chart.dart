import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'dart:ui_web' as ui_web;

class SimpleChart extends StatefulWidget {
  final String title;
  final String url;
  
  const SimpleChart({
    super.key,
    required this.title,
    required this.url,
  });

  @override
  State<SimpleChart> createState() => _SimpleChartState();
}

class _SimpleChartState extends State<SimpleChart> {
  String? viewType;

  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      viewType = 'iframe-${widget.title.toLowerCase().replaceAll(' ', '-')}';
      _registerIframe();
    }
  }

  void _registerIframe() {
    if (kIsWeb && viewType != null) {
      ui_web.platformViewRegistry.registerViewFactory(
        viewType!,
        (int viewId) {
          return html.IFrameElement()
            ..src = widget.url
            ..style.border = 'none'
            ..style.width = '100%'
            ..style.height = '100%';
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.all(8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          children: [
            kIsWeb ? _buildWebContent() : _buildMobilePlaceholder(),
            Positioned(
              top: 8,
              left: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWebContent() {
    if (viewType != null) {
      return HtmlElementView(viewType: viewType!);
    }
    return Container(
      color: Colors.grey[800],
      child: const Center(
        child: CircularProgressIndicator(color: Colors.white),
      ),
    );
  }

  Widget _buildMobilePlaceholder() {
    return Container(
      color: Colors.grey[300],
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.web, size: 48, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'Web charts not supported\non mobile platforms',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}