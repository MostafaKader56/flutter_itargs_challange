Flutter Developer Position Coding Challenge

This repository contains my submission for the Flutter developer position coding challenge.
Challenge Overview

The challenge required the creation of a Flutter application with the following main features:

    Display two sections: Top Likes and Listen Audios.
    Provide functionality to navigate between these sections through a Tab bar.
    Display dummy information in the Top Likes section with a like button for each item.
    Fetch audio URLs from the provided API and play them using a media player in the Listen Audios section.
    Implement a "More" tab with the ability to change language and switch to dark mode. The UI should respond accordingly to these changes.

Architecture

The application is built using the MVVM (Model-View-ViewModel) architecture. The code is structured to support easy unit testing, with at least one unit test included.
Interface

The emphasis in the interface was on functionality rather than design. The UI was designed to be functional and ready to use, with a focus on displaying the required information and providing the specified features.
Implementation Details

    The app is structured using the MVVM architecture for better maintainability and testability.
    The Top Likes section displays dummy information with like functionality.
    The Listen Audios section fetches audio URLs from the provided API and plays them using a media player.
    The "More" tab allows users to change the language and switch to dark mode, with the UI responding accordingly.

How to Run

To run the project, follow these steps:

    Clone this repository to your local machine.
    Open the project in a Flutter-compatible IDE.
    Run the app on a simulator or a physical device.

Notes

    The app caches audio to ensure availability in offline mode.
    Loading indicators are displayed during audio loading.
    Error scenarios are handled by showing an alert view.

For any questions or feedback regarding this submission, feel free to contact me.
