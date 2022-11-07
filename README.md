<h1 align="center">Marvels</h1>
<h3 align="center">An iPhone application to explore Marvel characters.</h3>

## About

This repository includes an iOS application to display the list of Marvel charcaters and there series.
The purpose of this project is to develop an app using MVVM architecture, and including a bunch of unit tests using Swift language.
The app uses the Marvel API's to display descriptions and images of the various characters in the Marvel universe.

This project has been built using UIKit and no third party dependencies.

## Features

- **Characters list:** displays a paginated list of characters and their thumbnails.
- **Character detail:** displays a picture of a character, it's full description and the Marvel series of those characters.
<p align="center">
  <img src="./Images/Characters.png" height="512">
  <img src="./Images/CharacterDetails.png" height="512">
</p>


## Technical details

### Architecture

This app has been developed using a simple MVVM architectural pattern. MVVM (Model View ViewModel) is an architectural pattern which attempts to more clearly separate the development of user-interfaces (UI) from that of the business logic and behaviour in an application. The app has three major layers: 
- The **Presentation** layer, which contains the views and other UIKit-related units.
- The **Domain** layer, which contains the business logic and use cases.
- The **Data** layer, which contains the networking, the models and authentication logic needed to connect to the Marvel API.

### Tests

This app has a bunch of unit tests. The networking model, as well as the models and authentication logic has been tested thoroughly. The code coverage is not 100% as it contains the unit test cases only.


## Download and run

- **Clone**: First, clone the repository with the 'clone' command.

```
$ git clone git@github.com:AnuragMehtaCG/Marvels.git
```

- **Marvel API keys**: Set your Marvel API keys as environment variables. Go to schemes, Marvel, and select Edit Scheme. Then, insert the environment variables into Run option -> Arguments -> Environment Variables.
<p align="center">
<img src="./Images/HowToEditScheme.png"> <img src="./Images/HowToEnterAPIKeys.png"> 
</p>


