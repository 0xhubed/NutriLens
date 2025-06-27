# NutriLens - AI-Powered Food Tracking Application

<div align="center">
  <img src="assets/logo.png" alt="NutriLens Logo" width="200"/>
  
  **A modern, intelligent nutrition tracking app that uses AI to analyze food photos and provide instant nutritional information.**
  
  [![Flutter](https://img.shields.io/badge/Flutter-3.24.5-blue.svg)](https://flutter.dev)
  [![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
  [![Platform](https://img.shields.io/badge/Platform-iOS%20%7C%20Android%20%7C%20Web%20%7C%20Desktop-lightgrey.svg)](https://flutter.dev/multi-platform)
</div>

## 🌟 Features

### 📸 AI-Powered Food Recognition
- **Instant Analysis**: Take a photo of your meal and get immediate nutritional information
- **Multiple AI Providers**: Supports OpenAI (GPT-4o), Anthropic (Claude 3.5), and Google (Gemini)
- **Smart Fallback**: Automatically switches between providers if one fails
- **Correction Features**: "Help AI" and "Partially Correct" options for improved accuracy

### 🎯 Advanced AI Assistance
- **Help AI Feature**: Provide hints when AI misidentifies food
- **Partial Correction**: Fine-tune AI detection when it's close but not perfect
- **Alternative Suggestions**: Get smart food alternatives based on the detected item
- **Contextual Learning**: AI improves with user feedback

### 📊 Comprehensive Nutrition Tracking
- **Detailed Macros**: Track calories, protein, carbohydrates, and fats
- **Visual Analytics**: Beautiful charts and progress indicators
- **Daily Summaries**: Quick overview of your nutritional intake
- **Meal History**: Browse and edit past entries

### 🎨 Modern, Intuitive Design
- **Material Design 3**: Latest Google design language
- **Dark Mode Support**: Automatic theme switching
- **Smooth Animations**: Delightful transitions and micro-interactions
- **Color-Coded Nutrition**: Visual indicators for different macro categories

### 🔒 Privacy & Security
- **Local Storage**: All data stored securely on your device
- **Secure API Keys**: Encrypted storage for provider credentials
- **No Data Collection**: Your food photos and data remain private

## 📱 Screenshots

<div align="center">
  <img src="assets/screenshot1.png" alt="Home Screen" width="250"/>
  <img src="assets/screenshot2.png" alt="Camera Screen" width="250"/>
  <img src="assets/screenshot3.png" alt="Analysis Screen" width="250"/>
</div>

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.24.5 or higher)
- Dart SDK (3.5.4 or higher)
- An IDE (VS Code, Android Studio, or IntelliJ)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/nutriLens.git
   cd nutriLens/snaptrack
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Setting Up AI Providers

1. Navigate to **Settings → AI Provider Settings**
2. Select your preferred provider (OpenAI, Anthropic, or Google)
3. Enter your API key
4. Set as primary or fallback provider

#### Getting API Keys:
- **OpenAI**: [platform.openai.com/api-keys](https://platform.openai.com/api-keys)
- **Anthropic**: [console.anthropic.com](https://console.anthropic.com)
- **Google**: [aistudio.google.com/app/apikey](https://aistudio.google.com/app/apikey)

## 🏗️ Architecture

### Tech Stack
- **Framework**: Flutter (Dart)
- **State Management**: Riverpod
- **Database**: Isar Database
- **Routing**: GoRouter
- **AI Integration**: REST APIs with multiple providers

### Project Structure
```
snaptrack/
├── lib/
│   ├── core/          # Core utilities and theme
│   ├── data/          # Data models, services, providers
│   ├── ui/            # User interface screens
│   └── main.dart      # Application entry point
├── test/             # Unit and widget tests
└── assets/           # Images and resources
```

## 🎨 Design System

### Color Palette
- **Primary**: Green (#00C896) - Health and nutrition
- **Secondary**: Orange (#FF6B35) - Energy and calories
- **Accent Colors**:
  - Purple (#8E4EC6) - Protein
  - Blue (#2196F3) - Carbohydrates
  - Yellow (#FFB300) - Fats

### Typography
The app uses a carefully crafted typography scale for optimal readability and visual hierarchy.

### Animations
- Fade transitions for smooth content loading
- Slide animations for navigation
- Pulse effects for loading states
- Scale feedback for interactive elements

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guidelines](CONTRIBUTING.md) for details.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- AI providers for their powerful APIs
- Material Design team for design guidelines
- Our contributors and users for their valuable feedback

## 📧 Contact

For questions or support, please open an issue on GitHub or contact us at support@nutrilens.app

---

<div align="center">
  Made with ❤️ using Flutter
</div>