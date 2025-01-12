# Weatherize 🌤️

This is a Flutter-based weather application that provides:  
- **Current Weather**: Displays the current temperature, humidity, and weather conditions.  
- **4-Day Forecast**: Horizontal scrollable list with daily forecasts.  
- **Search Functionality**: Allows users to search for any city.  
- **Temperature Unit Toggle**: Switch between Celsius and Fahrenheit.  

---

## Features

1. Search for weather by city name.  
2. Display current weather and a 4-day forecast.  
3. Toggle between Celsius and Fahrenheit units.  
4. Save last searched city and unit preferences.  
5. Gracefully handle API errors with user-friendly messages.  

---

## Requirements

- Flutter SDK  
- Dart SDK  
- API key for [OpenWeatherMap](https://openweathermap.org/api)  

---

## Getting Started

### **Clone the Repository**
```bash
git clone https://github.com/Kumar-3/Weatherize.git
cd Weatherize
```

---

### **Setup Instructions**

#### **1. Install Flutter**  
Ensure you have Flutter installed on your machine. You can follow the [official Flutter installation guide](https://docs.flutter.dev/get-started/install).  

#### **2. Get an OpenWeatherMap API Key**  
1. Go to the [OpenWeatherMap website](https://openweathermap.org/api).  
2. Sign up or log in to your account.  
3. Navigate to the API section, and create a new API key.  

#### **3. Configure the API Key**  
1. Create a directory named `config` in the root of your project.  
2. Inside the `config` directory, create a file named `app_config.json`.  
3. Add your API key to the file in the following format:  
   ```json
   {
       "API_KEY": "your_api_key_here"
   }
   ```  

4. Add the `config` directory to your `pubspec.yaml` file under the `flutter` section:  
   ```yaml
   flutter:
     assets:
       - config/app_config.json
   ```

5. Run the following command to fetch dependencies and apply changes:  
   ```bash
   flutter pub get
   ```

#### **4. Install Dependencies**  
Run the following command to fetch all required dependencies:  
```bash
flutter pub get
```

#### **5. Run the App**  
Connect a physical device or start an emulator, then execute:  
```bash
flutter run
```

---

### **Build APK for Testing**

To generate an APK for testing:  
```bash
flutter build apk --release
```  
The APK will be located at:  
```
build/app/outputs/flutter-apk/app-release.apk
```

---

### **Troubleshooting**

- **API Key Issues**: Ensure the API key is valid and active.  
- **Flutter Issues**: Run `flutter doctor` to check for missing dependencies or configurations.  
- **Dependency Issues**: If you encounter dependency conflicts, delete the `pubspec.lock` file and run `flutter pub get` again.  

---

Feel free to contact me for any further assistance or clarifications! 😊  
