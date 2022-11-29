<!-- Improved compatibility of back to top link: See: https://github.com/othneildrew/Best-README-Template/pull/73 -->
<a name="readme-top"></a>
<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Don't forget to give the project a star!
*** Thanks again! Now go create something AMAZING! :D
-->

<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
<center>

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/Avalanche-Safety-People/flakes_of_wrath_fe">
    <img src="app/assets/images/iso-republic-scenic-road-snowy-mountains Small.png" alt="Logo" width="500" height="300">
  </a>

<h1 align="center"><strong>Flakes of Wrath</strong></h1>

  <p align="center">
    <h2> Plan winter trips into the backcountry with smart forecasts and a proprietary avalanche prediction algorithm.  </h2>
    <br />
    <a href="https://flakes-of-wrath.fly.dev"><strong>See it live</strong></a>
    <br />
    <br />
    <a href="https://github.com/Avalanche-Safety-People/flakes_of_wrath_fe/issues">Report Bug</a>
    ·
    <a href="https://github.com/Avalanche-Safety-People/flakes_of_wrath_fe/issues">Request Feature</a>
  </p>
</div>
<br>

### Built with:

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Issues][issues-shield]][issues-url]

![Ruby on Rails](https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white)
![CSS](https://img.shields.io/badge/CSS-239120?&style=for-the-badge&logo=css3&logoColor=white)
![HTML](https://img.shields.io/badge/HTML-239120?style=for-the-badge&logo=html5&logoColor=white)
![Markdown](https://img.shields.io/badge/Markdown-000000?style=for-the-badge&logo=markdown&logoColor=white)
![Tailwind CSS](https://img.shields.io/badge/Tailwind_CSS-38B2AC?style=for-the-badge&logo=tailwind-css&logoColor=white)
![Bootstrap](https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
![Heroku](https://img.shields.io/badge/Heroku-430098?style=for-the-badge&logo=heroku&logoColor=white)
![CircleCI](https://img.shields.io/badge/circleci-343434?style=for-the-badge&logo=circleci&logoColor=white)
![Miro](https://img.shields.io/badge/Miro-050038?style=for-the-badge&logo=Miro&logoColor=white)

[![forthebadge](https://forthebadge.com/images/badges/winter-is-coming.svg)](https://forthebadge.com)
[![forthebadge](https://forthebadge.com/images/badges/does-not-contain-msg.svg)](https://forthebadge.com)
[![forthebadge](https://forthebadge.com/images/badges/uses-badges.svg)](https://forthebadge.com)

</center>


<!-- TABLE OF CONTENTS -->

### About The Project

  <h1><summary>Table of Contents</summary></h1>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
        <li><a href="#built-with">Built With</a></li>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
        <li><a href="#prerequisites">Prerequisites</a></li>
    </li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>



<!-- ABOUT THE PROJECT -->

Database tables are stored on the back end of the app, but to make sure you can see how the info relates here is a visualization of the tables

<img src="app/assets/images/schema.png" alt="Logo" width="500" height="300">

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- GETTING STARTED -->

## Prerequisites

This project requires Ruby 2.7.4
- must use Rails 5.2.x
- must use PostgreSQL

<br>

## Setup/Install
* Fork this repository
* Clone your fork
* From the command line, install gems and set up your DB:
    * `bundle`
* APIs used
  * Please follow the link to get your `client id` and `client secret` used later https://developers.google.com/identity/protocols/oauth2
  * `bundle exec figaro install`
    * go to `config/application.yml`
    * name your API key from open weather `GOOGLE_CLIENT_ID` and `GOOGLE_CLIENT_SECRET`
<center>
<img src="app/assets/images/api-key.png" width="350" height="200">
</center>

* Run `rails db:{create,migrate}`
* Run the test suite with `bundle exec rspec`.
* To see the app in production go to [Flakes of Wrath](https://flakes-of-wrath.fly.dev) on Fly.io

<!-- CONTACT -->
## Contact

Individual contributors :
* [Gavin Carew](https://github.com/gjcarew)
* [Kaelin Sleevi](https://github.com/KaelinSleevi)
* [Jake Kim](https://github.com/LlamaBack)
* [Noah van Ekdom](https://github.com/noahvanekdo)
* [Ryan Smith](https://github.com/RyanChrisSmith)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

We are immensely grateful to the US Forest Service, Northwest Avalanche Center and the  National Avalanche Center. None of this would be possible without the work of hundreds of individual forecasters and field observers taking snowpack measurements throughout the united states. 

<p align="right">(<a href="#readme-top">back to top</a>)</p>




<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/Avalanche-Safety-People/flakes_of_wrath_fe.svg?style=for-the-badge
[contributors-url]: https://github.com/Avalanche-Safety-People/flakes_of_wrath_fe/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/Avalanche-Safety-People/flakes_of_wrath_fe.svg?style=for-the-badge
[forks-url]: https://github.com/Avalanche-Safety-People/flakes_of_wrath_fe/network/members
[issues-shield]: https://img.shields.io/github/issues/Avalanche-Safety-People/flakes_of_wrath_fe.svg?style=for-the-badge
[issues-url]: https://github.com/Avalanche-Safety-People/flakes_of_wrath_fe/issues
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/linkedin_username
[product-screenshot]: images/screenshot.png
[Bootstrap.com]: https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white
[Bootstrap-url]: https://getbootstrap.com
[Tailwind.com]: https://tailwindcss.com/
[Tailwind-url]: https://raw.githubusercontent.com/tailwindlabs/tailwindcss/HEAD/.github/logo-light.svg
