Weather Forecast App
A sleek, modern weather application built with Flutter, demonstrating Clean Architecture principles and utilizing the GetX package for state management. The app features a beautiful, theme-aware UI with both light and dark modes, complete with smooth animations.

Features
Multi-City Weather: View weather cards for a predefined list of major cities on the home screen.

Detailed Forecast: Tap on any city to see a detailed weather screen with information like humidity, wind speed, pressure, and visibility.

Clean Architecture: Follows a strict separation of concerns (Data, Domain, Presentation) for a scalable and maintainable codebase.

Reactive State Management: Uses GetX for efficient and minimal state management.

Light & Dark Themes: A beautiful, theme-aware UI that can be switched between light and dark modes. The user's preference is saved locally.

Engaging Animations: Smooth, staggered animations on list items and page elements, powered by the flutter_animate package.

Architecture
The project follows Clean Architecture principles to ensure the code is modular, testable, and independent of external frameworks or UI.

/domain: Contains the core business logic, entities, and abstract repository contracts. It has no dependencies on any other layer.

/data: Implements the repositories defined in the domain layer. It handles fetching data from the OpenWeatherMap API and mapping it to the domain entities.

/presentation: Contains all the UI-related components, including pages, widgets, GetX controllers, and bindings.

/common: Holds reusable code, such as custom widgets, utility functions, and style definitions (colors, themes).

🚀 Setup and Installation
To get the project up and running on your local machine, follow these simple steps.

1. Prerequisites
Ensure you have the Flutter SDK installed on your machine.

You will need an API Key from OpenWeatherMap.

2. Get the Code
# Clone the repository (or download the source code)
git clone https://github.com/hansraj3160/weather_forcast_app.git

# Navigate into the project directory
cd weather-forecast-app

3. Add Your API Key
Open the following file in your editor:
lib/data/data_sources/remote_data_source.dart

Find the _apiKey variable and replace 'YOUR_API_KEY' with your actual OpenWeatherMap API key.

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;
  // IMPORTANT: Replace with your key
  final String _apiKey = 'YOUR_API_KEY';
  // ...
}

4. Install Dependencies
Run the following command in your terminal to install all the necessary packages.

flutter pub get

5. Run the App
# Run in debug mode
flutter run

# Run in release mode (requires internet permission and ProGuard setup)
flutter run --release

📦 Key Packages Used
get: For state management, dependency injection, and routing.

http: For making API calls to the weather service.

flutter_animate: For creating beautiful, simple animations.

get_storage: For persisting the user's theme preference locally.

equatable: For simplifying value comparisons in domain entities.