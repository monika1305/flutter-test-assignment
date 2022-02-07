# Sportsbet Flutter Assignment


This assignment will tell us how you approach the problem and implement the requirements. 

You will be integrating tmdb API. Api key is required to fetch the data from their server. You can check this guide for [api key](https://developers.themoviedb.org/3/getting-started/introduction). 

### Requirements:

This assignment is to build two screens in Flutter. One is main screen and second is details screen. Detail screen should open when user clicks one of the items from main screen.

#### Main Screen:

Main screen should have the following:

* Vertical List with collapsible toolbar (use any random movie image as  collapsible toolbar image)

* Vertical list should have 4 collapsible sections, each with title and horizontally scrollable list

* Integrate following APIs in each collapsible sections as horizontal list in order:

  * [Latest movies](https://developers.themoviedb.org/3/movies/get-now-playing)

  * [Popular movies](https://developers.themoviedb.org/3/movies/get-popular-movies)

  * [Top Rated movies](https://developers.themoviedb.org/3/movies/get-top-rated-movies)

  * [Upcoming movies](https://developers.themoviedb.org/3/movies/get-upcoming)

* Populate the first two sections when user lands on Main screen keep other two in collapsed state but show the section title. Each item in the horizontal list should have movie image and the movie title.

* Fetch data for third and fourth section if user clicks to expand any of those sections. 

* User should be able to collapse, expanded section and vice versa from the section title bar.

* Poll the Latest Movies API every 30 seconds to fetch the latest data and update the view. Remember to close polling if Latest Movies section is collapsed.

* Clicking on any item in horizontal list should open item details bottom sheet.

#### Detail screen:

* Implement detail screen as bottom sheet

* Detail screen should display selected movie image and other information from [this link](https://developers.themoviedb.org/3/movies/get-movie-details) 

* In the response, if video is available show a play icon (use any free resource available). Clicking on this icon snackbar should appear with movie name.

Your final app should look something like this.

![Main and Detail Page](https://user-images.githubusercontent.com/80252481/152755742-81fec6d8-02e5-4ff6-81a5-7d5c4d4e78f6.png)


#### Please keep is in mind following:

* Your code should compile without errors and app should run on both iOS and Android seamlessly

* Show loader while data is loading and display error snackbar in case of error

* Use bloc pattern if possible

* Try to implement the app in modular and reusable way

* Most importantly, keep things simple and fun

* Once you have completed the task, share link to the repository on the code hosting site (github, Bitbucket etc).

* Please, Make sure that we have access to your project when you submit for review. 

Goodluck!
