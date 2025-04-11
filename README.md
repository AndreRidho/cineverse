# CineVerse: Movie Discovery App

## Overview

CineVerse is a feature-rich movie exploration application built with Flutter that allows users to discover, search, and manage their favorite movies using The Movie Database (TMDB) APIs. The app demonstrates clean architecture principles, modern Flutter practices, and provides an excellent user experience.

## Features

- **Authentication**: Complete TMDB authentication flow with secure token storage
- **Home Screen**: Categorized movie lists with smooth scrolling
- **Movie Details**: Comprehensive information with cast, crew, and similar movies
- **Search**: Advanced search functionality with filters
- **User Profile**: Personalized user experience with watchlist management
- **Offline Support**: Browse previously loaded content without internet
- **Localization**: Support for multiple languages including RTL layouts
- **Platform Integration**: Custom platform channel implementation for device information
- **Settings**: Theme customization, language selection, and cache management

## Technical Implementation

### Architecture & Organization

The application follows Clean Architecture principles with proper separation of concerns:

- **Presentation Layer**: UI components, Cubits for state management
- **Domain Layer**: Use cases, entities, and repository interfaces
- **Data Layer**: Repository implementations, data sources, and DTOs

Code is organized by features with appropriate layer separation, making the codebase scalable and maintainable.

### Dependency Injection

- Implemented using GetIt with code generation via Injectable
- Services and repositories are properly injected with appropriate scopes
- Dependencies are initialized at app startup

### Code Generation

To reduce boilerplate code, multiple code generation tools were utilized:

- **JSON Serialization**: json_serializable for model parsing
- **API Client**: retrofit_generator for type-safe API integration
- **Immutable Models**: freezed for immutable state and model classes
- **DI Code**: injectable for dependency injection code generation

### State Management

- Implemented Cubit pattern throughout the application
- Unidirectional data flow ensures predictable state transitions
- Proper handling of loading, success, and error states
- State persistence where appropriate (user preferences, authentication)

### API Integration & Caching

- TMDB API integration using Dio with Retrofit
- Type-safe API clients and models
- Comprehensive error handling with request retries
- ObjectBox for local database caching with 30-second validity period
- Cache-first strategy with background refresh

### User Experience

- Skeleton loaders during content loading
- Smooth animations and transitions between screens
- Responsive layouts for different screen sizes
- Appropriate feedback for user actions

### Authentication

- Complete TMDB authentication flow
- Secure token storage using Flutter Secure Storage
- Persistent session management

### Offline Support

- Persistent storage for user data and movie information
- Offline browsing of previously loaded content
- Synchronization mechanisms for updated content
- Timestamp tracking for cache validity

### Localization

- Support for multiple languages
- Locale-specific formatting
- User-selectable language settings in app
- RTL support for appropriate languages

### Platform Integration

- Custom platform channel implementation for device information:
  - Device model
  - OS version
  - Available storage space
  - Battery level
- Implemented on both Android (Kotlin) and iOS (Swift)
- Displayed in "About Device" section in settings
- Graceful error handling for unavailable features

## Setup Instructions

### Prerequisites

- Flutter (latest stable version)
- Android Studio / Xcode
- TMDB API key

### Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/AndreRidho/cineverse.git
   cd cineverse
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

4. Run the code generators:
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

5. Run the app:
   ```bash
   flutter run
   ```

## Design Decisions and Rationale

### Why Clean Architecture?

Clean Architecture was chosen to ensure separation of concerns and testability. The domain layer is completely independent of external frameworks, making the business logic portable and framework-agnostic.

### Cubit over BLoC

Cubit was selected for state management due to its simplicity while still providing unidirectional data flow. For this application's complexity level, Cubit offers the right balance between power and simplicity.

### ObjectBox for Local Storage

ObjectBox was selected over SQLite/SQFlite for its:
- Better performance with complex queries
- Type-safe database operations
- Simpler relationship mappings
- Native support for reactive data

### Retrofit for API Integration

Retrofit provides type-safe API clients through code generation, reducing potential runtime errors and improving developer experience.

### Platform Channel Implementation

The decision to use platform channels for device information rather than a package was made to demonstrate:
- Understanding of cross-platform integration
- Native code implementation skills
- Proper handling of platform-specific features

## Known Limitations

- The app currently supports a limited set of languages
- Search filters are limited to basic options
- Some UI elements may need refinement on specific device sizes

## Future Improvements

- Add more sophisticated recommendation algorithms
- Implement social features for sharing
- Add video playback for trailers
- Expand language support
- Enhance accessibility features
