
# The Movie Database

An iOS application that utilizes the TMDB (The Movie Database) API to display a list of movies and provide detailed information about each movie.


## Features

- Display a list of movies retrieved from the TMDB API.
- View detailed information about each movie, including title, overview, vote average, release date, popularity, and original language.
- Developed using Swift, RxSwift, MVVM (Model-View-ViewModel) architecture, Moya for networking, and SnapKit for layout constraints.


## Tech Stack

**Swift:** The programming language used to develop the iOS application.

**RxSwift:** A reactive programming framework for Swift, providing a declarative way to handle asynchronous operations and events.

**MVVM:** An architectural pattern that separates the concerns of data presentation, business logic, and data modeling.

**Moya:** A network abstraction layer that simplifies network requests and API communication.

**SnapKit** A Swift DSL (Domain-Specific Language) for Autolayout, making it easier to define constraints programmatically.


## Usage

1- Launch the application on your iOS device or simulator.

2- Explore the list of movies and select a movie to view its details.



## Roadmap

- Additional browser support

- Add more integrations


## Requirements
- **Xcode:** [Download Xcode](https://developer.apple.com/xcode/)
- **Cocoapods:** Dependency manager for Swift and Objective-C projects. Install using `sudo gem install cocoapods`
- **TMDB API Key:** To use this application, you'll need to obtain your own TMDB API key.

## Run Locally

Clone the repository:
```bash
  git clone https://github.com/YaserBahrami/TMDB.git
```
Navigate to the project directory:
```bash
  cd TMDB
```
Install dependencies using Cocoapods:
```bash
  pod install
```
Open the project in Xcode:
```bash
  open TMDB.xcworkspace
```
Replace TMDB API Key
```swift
Credentials.shared.getAPIKey() //"YOUR_API_KEY"
```

## Screenshots

![App Screenshot](https://via.placeholder.com/468x300?text=App+Screenshot+Here)


## Demo

Insert gif or link to demo


## Lessons Learned

What did you learn while building this project? What challenges did you face and how did you overcome them?


## License

This project is licensed under the [MIT](https://choosealicense.com/licenses/mit/) license


