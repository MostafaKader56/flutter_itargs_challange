# Flutter Developer Position Coding Challenge

This repository contains my submission for the Flutter developer position coding challenge.

## Challenge Overview

In this challenge, I created a Flutter application with the following main features:

1. Display two sections:
   - Top Likes
   - Listen Audios
2. Implement navigation between these sections using a Tab bar.
3. Display 3 dummy information items in the Top Likes section, each with a like button.
4. Utilize [this API](https://api.quran.com/api/v4/chapter_recitations/1/1) to fetch audio URLs (MP3) for the Listen Audios section and play them using a media player within the app.
5. Implement a "More" tab with the functionality to:
   - Change the language
   - Switch to dark mode
   - Ensure that the dummy information in the Top Likes section is responsive to these changes.

## Architecture

The application is built following the MVVM (Model-View-ViewModel) architecture. The codebase is designed to be easily unit testable, although no specific unit tests have been included in this submission.

## Interface

The focus was on functionality rather than intricate UI design. The UI was created to be functional and ready to use, adhering to the requirements specified in the challenge.

## Implementation Details

- Utilized the MVVM architecture for a structured and maintainable codebase.
- Implemented the Top Likes section to display dummy information with like functionality.
- Fetched audio URLs from the provided API and played them using a media player in the Listen Audios section.
- Created a "More" tab to allow users to change the language and switch to dark mode, with the UI responding accordingly.

## How to Run

To run the project, follow these steps:

1. Clone this repository to your local machine.
2. Open the project in a Flutter-compatible IDE.
3. Run the app on a simulator or a physical device.

## Notes

- The app caches audio to ensure availability in offline mode.
- Loading indicators are displayed during audio loading.
- Error scenarios are handled by showing an alert view.

For any questions or feedback regarding this submission, feel free to contact me.
