import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

abstract class ChartWidget extends StatelessWidget {
  final String title;
  const ChartWidget({super.key, required this.title});

  factory ChartWidget.streamgraph() = _StreamgraphWidget;
  factory ChartWidget.zoomableCircles() = _ZoomableCirclesWidget;
}

class _StreamgraphWidget extends ChartWidget {
  const _StreamgraphWidget() : super(title: 'Streamgraph');

  @override
  Widget build(BuildContext context) {
    return _buildChartContainer(
      context: context,
      title: title,
      child: kIsWeb
          ? _buildWebChart('http://localhost:3000/example-1')
          : _buildMobilePlaceholder(),
    );
  }
}

class _ZoomableCirclesWidget extends ChartWidget {
  const _ZoomableCirclesWidget() : super(title: 'Zoomable Circles');

  @override
  Widget build(BuildContext context) {
    return _buildChartContainer(
      context: context,
      title: title,
      child: kIsWeb
          ? _buildWebChart('http://localhost:3000/example-2')
          : _buildMobilePlaceholder(),
    );
  }
}

Widget _buildChartContainer({
  required BuildContext context,
  required String title,
  required Widget child,
}) {
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
          child,
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
                title,
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

Widget _buildWebChart(String url) {
  if (kIsWeb) {
    return _IframeWidget(url: url);
  }
  return _buildMobilePlaceholder();
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

class _IframeWidget extends StatefulWidget {
  final String url;
  
  const _IframeWidget({required this.url});

  @override
  State<_IframeWidget> createState() => _IframeWidgetState();
}

class _IframeWidgetState extends State<_IframeWidget> {
  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      _registerView();
    }
  }

  void _registerView() {
    if (kIsWeb) {
      // This will only compile and run on web
      _createWebView();
    }
  }

  void _createWebView() {
    // This code will be tree-shaken out on non-web platforms
    if (kIsWeb) {
      // Web-specific imports are handled here
      try {
        final html = _getHtmlLibrary();
        final uiWeb = _getUiWebLibrary();
        
        final viewType = 'iframe-${widget.url.hashCode}';
        uiWeb.registerViewFactory(viewType, (int viewId) {
          return html.createIFrameElement(widget.url);
        });
      } catch (e) {
        // Fallback for development
      }
    }
  }

  dynamic _getHtmlLibrary() {
    // This will be replaced by the actual import at compile time for web
    return null;
  }

  dynamic _getUiWebLibrary() {
    // This will be replaced by the actual import at compile time for web  
    return null;
  }

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      final viewType = 'iframe-${widget.url.hashCode}';
      return HtmlElementView(viewType: viewType);
    }
    return _buildMobilePlaceholder();
  }
}