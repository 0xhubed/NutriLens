# NutriLens

An AI-powered nutrition tracking app with photo and text analysis, built with Flutter.

## Features

- 📸 Photo-based food logging with AI analysis
- ✍️ Text-based food entry and description
- ⚖️ Weight tracking and portion-based calculations
- 🧠 AI-powered nutrition analysis (OpenAI, Anthropic, Gemini)
- 📊 Daily nutrition summaries and analytics
- 📈 Progress tracking with macro distribution charts
- 🗃️ Food history with editing capabilities
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

3. Generate code (for Hive database):
```bash
dart run build_runner build
```

4. Run the app:
```bash
flutter run
```

## Configuration

### AI Provider Configuration

To use AI-powered food analysis, configure one or more providers:

**OpenAI:**
1. Get an API key from [OpenAI](https://platform.openai.com/api-keys)
2. Go to Settings > AI Provider Settings
3. Select OpenAI and enter your API key

**Anthropic:**
1. Get an API key from [Anthropic](https://console.anthropic.com/)
2. Go to Settings > AI Provider Settings  
3. Select Anthropic and enter your API key

**Google Gemini:**
1. Get an API key from [Google AI Studio](https://aistudio.google.com/app/apikey)
2. Go to Settings > AI Provider Settings
3. Select Gemini and enter your API key

The API key is stored locally using Flutter Secure Storage and never leaves your device except for API calls.

## Architecture

- **State Management**: Riverpod
- **Database**: Hive (local, NoSQL)
- **Navigation**: go_router
- **UI**: Material 3
- **AI Integration**: Multiple AI providers (OpenAI, Anthropic, Gemini)

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

The only external communication is with AI providers (OpenAI, Anthropic, or Gemini) for food analysis, and only when you explicitly request it.

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