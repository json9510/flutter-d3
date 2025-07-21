# Flutter D3.js Charts

Beautiful interactive charts for mobile using Flutter with D3.js integration. This project demonstrates how to embed D3.js visualizations in Flutter web applications using iframes.

## Features

- **Streamgraph Chart**: Interactive flowing data visualization with hover effects and smooth animations
- **Zoomable Circle Packing**: Hierarchical circle visualization with zoom and pan interactions
- **Responsive Design**: Charts adapt to different screen sizes
- **Web Optimized**: Uses iframe integration for seamless D3.js embedding

## Project Structure

```
flutter-d3/
├── lib/
│   ├── main.dart           # Flutter app entry point
│   └── simple_chart.dart   # Chart widget with iframe integration
├── public/
│   ├── example-1.html      # Streamgraph D3.js implementation
│   └── example-2.html      # Zoomable circles D3.js implementation
├── server.js              # Node.js server for serving D3.js charts
└── package.json           # Server dependencies
```

## Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- [Node.js](https://nodejs.org/) (for serving D3.js charts)
- Chrome or any modern web browser

## Installation & Setup

1. **Clone the repository**
   ```bash
   git clone <your-repo-url>
   cd flutter-d3
   ```

2. **Install Flutter dependencies**
   ```bash
   flutter pub get
   ```

## Running the Project

You need to run both the D3.js server and the Flutter web app:

### Step 1: Start the D3.js Server

In the project root directory:

```bash
node server.js
```

You should see:
```
Server running on http://localhost:3000
```

**Verify server is working:**
- Visit `http://localhost:3000/example-1` to see the Streamgraph
- Visit `http://localhost:3000/example-2` to see the Zoomable Circles

### Step 2: Start the Flutter Web App

In a new terminal window, from the project root:

```bash
flutter run -d web-server --web-port 8080
```

Wait for the compilation to complete. You should see:
```
lib/main.dart is being served at http://localhost:8080
```

### Step 3: View the App

Open your web browser and navigate to:
```
http://localhost:8080
```

You should see both D3.js charts integrated within the Flutter app interface.

## Development

### Hot Reload
While the Flutter app is running, you can make changes to the Dart code and press `r` in the terminal to hot reload.

### Modifying Charts
- Edit `public/example-1.html` for the Streamgraph
- Edit `public/example-2.html` for the Zoomable Circles
- Refresh the browser to see D3.js changes

### Platform Support
- **Web**: Full D3.js chart integration
- **Mobile**: Shows placeholder (charts are web-only in this implementation)

## Troubleshooting

### Server Issues
- Ensure port 3000 is not in use by other applications
- Check that all HTML files exist in the `public/` directory

### Flutter Compilation Issues
- Run `flutter clean` then `flutter pub get`
- Ensure you're using a recent version of Flutter
- Check that the web platform is enabled: `flutter config --enable-web`

### Chart Not Loading
- Verify both servers are running (ports 3000 and 8080)
- Check browser console for CORS or network errors
- Ensure D3.js CDN is accessible

## Technologies Used

- **Flutter**: UI framework for web application
- **D3.js**: Data visualization library
- **Node.js**: Server for serving D3.js charts
- **HTML/CSS/JavaScript**: Chart implementations

## Next Steps

- Add more D3.js chart types
- Implement mobile-native chart alternatives
- Add data binding between Flutter and D3.js
- Deploy to production with proper CORS configuration

## License

This project is open source and available under the [MIT License](LICENSE).
