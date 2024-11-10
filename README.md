# Cricket Fan Engagement App

### An Interactive iOS Sports Platform for Cricket Fans

## Table of Contents
- [How to Run This Project](#how-to-run-this-project)
- [Project Overview](#project-overview)
- [Objectives](#objectives)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Architecture](#architecture)
- [Setup and Installation](#setup-and-installation)
- [Usage](#usage)
- [Testing and Evaluation](#testing-and-evaluation)
- [Project Outcomes](#project-outcomes)
- [Future Potential](#future-potential)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

---

## How to Run This Project

### Requirements
- **Xcode Version**: 16.0
- **macOS Version**: macOS 15 (Sequoia)

### Steps to Run
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/FlyingDuckss/CricketApp-iOS.git
   ```
2. **Install Package Dependencies**
3. **Select Device and Run**: Open the project in Xcode, select your desired device or simulator, and run the project.

## Project Overview

This project is a dynamic, interactive iOS sports app created specifically for cricket enthusiasts. Developed for a client with the aim of delivering an engaging platform, the app offers cricket fans real-time updates, team-specific content, and social features to enhance fan interaction. Built on iOS, the app emphasizes an intuitive, user-friendly interface that aligns with Apple's design principles for a polished and engaging user experience.

## Objectives

The main objectives of this app are:
1. **User Engagement**: Provide an interactive experience with live match updates, team stats, and polls.
2. **Reliable Architecture**: Implement MVVM-R for scalability and maintainability.
3. **Seamless User Experience**: Focus on iOS-compliant UI/UX to deliver an intuitive interface.

## Features

- **Login & Signup**: User registration and login functionality, secured via Firebase Authentication.
- **Favorite Team Selection**: Customizable notifications and updates for user-selected teams.
- **Match Viewing**: Overview of live and upcoming matches with detailed stats.
- **Match Details**: Access to player statistics, scores, and key moments.
- **Fan Chat**: Real-time chat for fans to discuss games.
- **Polls**: Interactive polls for fans to vote on cricket-related questions.

## Tech Stack

- **Platform**: iOS
- **Architecture**: MVVM-R (Model-View-ViewModel-Router)
- **Backend**: Firebase (Authentication, Real-Time Database)
- **Project Management**: JIRA

## Architecture

The app employs the MVVM-R architecture, ensuring scalability and modularity:
1. **Model**: Handles data and business logic.
2. **View**: Displays the UI and presents data to the user.
3. **ViewModel**: Serves as an intermediary, formatting data for the View.
4. **Router**: Manages navigation and screen transitions.

## Setup and Installation

To set up the app locally:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-username/cricket-fan-app.git
   ```
2. **Open in Xcode**: Open the `.xcodeproj` file in Xcode.
3. **Configure Firebase**:
   - Add your `GoogleService-Info.plist` file for Firebase setup.
4. **Run the App**:
   - Select your desired device or simulator and run the project.

## Usage

1. **Sign Up or Login**: New users can create an account, and returning users can log in.
2. **Select Favorite Teams**: Customize content based on your preferred teams.
3. **View Matches**: Access live or upcoming matches.
4. **Match Details**: See in-depth match stats and player info.
5. **Fan Interaction**: Chat with other fans and participate in polls.

## Testing and Evaluation

### Usability Testing
- **Objective**: Evaluate user experience.
- **Outcome**: Users found the app intuitive, with feedback incorporated for icon clarity and UI refinement.

### Functionality Testing
- **Objective**: Ensure features work as expected.
- **Outcome**: Successful tests, with fixes for minor bugs in chat retrieval.

### Performance Testing
- **Objective**: Assess response times and performance under load.
- **Outcome**: App demonstrated reliable performance, optimized for speed and data handling.

## Project Outcomes

The project successfully met client requirements, delivering a highly interactive and user-centered experience. Through the challenges of team restructuring and resource limitations, the project was completed on time, incorporating valuable feedback from user testing.

## Future Potential

The app's modular architecture allows for scalability:
- Potential to expand chat and polling features.
- Extend support to additional sports or teams.

## Contributing

Interested in contributing? Follow these steps:
1. Fork the repository.
2. Create a new branch.
3. Make changes and submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).

## Contact

For further inquiries, please contact the project team at **[104659862@student.swin.edu.au](mailto:104659862@student.swin.edu.au)**.
