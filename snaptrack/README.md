# SnapTrack

A privacy-first food tracking app built with Flutter.

## Features

- 📸 Photo-based food logging
- 🧠 AI-powered nutrition analysis
- 📊 Daily nutrition summaries
- 📱 Clean, Material 3 design
- 🔒 Privacy-first: all data stored locally

## Getting Started

### Prerequisites

- Flutter SDK (3.0.0 or higher)
- Dart SDK
- Android Studio / Xcode for mobile development

### Installation

1. Clone the repository:
```bash
git clone <repository_url>
cd snaptrack
```

2. Install dependencies:
```bash
flutter pub get
```

3. Generate code (for Isar database):
```bash
dart run build_runner build
```

4. Run the app:
```bash
flutter run
```

## Configuration

### OpenAI API Key

To use AI-powered food analysis:

1. Get an API key from [OpenAI](https://platform.openai.com/api-keys)
2. Open the app and go to Settings
3. Enter your API key securely

The API key is stored locally using Flutter Secure Storage and never leaves your device except for API calls.

## Architecture

- **State Management**: Riverpod
- **Database**: Isar (local, NoSQL)
- **Navigation**: go_router
- **UI**: Material 3
- **AI Integration**: OpenAI Vision API

## Project Structure

```
lib/
├── core/
│   ├── config/          # App configuration
│   ├── theme/           # UI theme
│   └── utils/           # Utility functions
├── data/
│   ├── models/          # Data models
│   ├── providers/       # Riverpod providers
│   └── services/        # Business logic
└── ui/
    ├── camera/          # Photo capture
    ├── analysis/        # AI analysis
    ├── history/         # Food history
    └── widgets/         # Shared widgets
```

## Privacy

SnapTrack is built with privacy as a core principle:

- ✅ All data stored locally on your device
- ✅ No user accounts or registration required
- ✅ API keys stored securely
- ✅ No analytics or tracking
- ✅ No data sharing with third parties

The only external communication is with the OpenAI API for food analysis, and only when you explicitly request it.

## Contributing

This is a personal project, but contributions are welcome! Please feel free to:

- Report bugs
- Suggest features
- Submit pull requests

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Roadmap

See our [roadmap plans](plans/) for upcoming features:

- v1.1: Multiple AI providers, smart categorization
- v1.2: Analytics and data insights
- v1.3: Activity tracking
- v2.0: Advanced features (barcode scanning, recipes, etc.)