# Epicture

![npm package](https://github.com/DanielDelaporus/Epitech-Rattrapage/blob/main/Epicture/Epicture/assets/logo.png)

An Epitech Project in which the objective was to create a mobile frontend using Imgur's API to access some of the basis fonctionality 

# How does it work ?

The project is using **flutter 1.22.6**

## Installation
The actual project is inside both the Epicture project
```
cd Epicture/Epicture
```

If the dependencies are not yet installed you can do so by using the command : 
```
flutter pub get
```
It will install the  following packages :
  -   **imgur**
  -   **flutter_web_auth**
  -   **image_picker**

To build the apk use the following :
```
flutter build apk --split-per-abi
```

## Achitecture

Most of the project is inside the **lib folder**.
The other folder are either the different configurations in which flutter can build the projet or assets and dependencies related contents.

Inside the lib folder you can find the main file which launches the app.
You can also find two subfolders, **Pages** and **API**.

The **API folder** contains all API related functions.
Authentification, Searches, Upload... Everything connected to Imgur.

   I used **FlutterWebAuth** for the Authentification pop-up.

   I used the **Imgur** package for all the other API calls. (A pretty useful package).

The **Pages folder** contains all the flutter visual pages.
  - **HomePage** : The starting point of the project.
               Quite simple actually, just a logo (that you can find in the assets) and a button used to connect the user to Imgur.
  - **BotBar** : The most important page.
             It is used the travel along the other pages thanks to a bottom navbar and a top title bar. Most of the other pages will be stored for inside this page.
  - **MyImagePage** : Display the Images for the logged in user's gallery.
  - **SearchImage** : Display the Images search from a TextInput query.
  - **UploadImage** : Gives the option to the user to upload image to their account's gallery.


# Contact me

**Email** : solal.depardieu@epitech.eu
