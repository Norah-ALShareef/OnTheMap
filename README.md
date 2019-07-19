# OnTheMap
This project is an app with a map that shows information posted by other students. The map will contain pins that show the location where other students have reported studying. By tapping on the pin users can see a URL for something the student finds interesting. The user will be able to add their own data by posting a string that can be reverse geocoded to a location, and a URL.

- LogIn Page

<img width="455" alt="Screen Shot 2019-07-19 at 7 02 13 PM" src="https://user-images.githubusercontent.com/40995452/61549968-0e95fd00-aa5a-11e9-8c43-b257b33d4bed.png">


- HomePage(MapView)

<img width="449" alt="Screen Shot 2019-07-19 at 7 02 57 PM" src="https://user-images.githubusercontent.com/40995452/61549969-0fc72a00-aa5a-11e9-9ea7-7f4447e9a9d8.png">


- HomePage(ListView)

<img width="449" alt="Screen Shot 2019-07-19 at 7 03 08 PM" src="https://user-images.githubusercontent.com/40995452/61549977-1190ed80-aa5a-11e9-927e-019db1ae392a.png">


- Add Location        

<img width="441" alt="Screen Shot 2019-07-19 at 7 03 39 PM" src="https://user-images.githubusercontent.com/40995452/61549988-16ee3800-aa5a-11e9-8ba0-ed54279e776b.png">


- PreviewLocation     

<img width="454" alt="Screen Shot 2019-07-19 at 7 04 27 PM" src="https://user-images.githubusercontent.com/40995452/61549990-19e92880-aa5a-11e9-9096-e655fe6a8e9e.png">

## Installation 

- clone this projet by adding this line to your Trminal

`https://github.com/Norah-ALShareef/OnTheMap.git`

- this URL to Login`"https://onthemap-api.udacity.com/v1/session"`

- this URL TO POST Student location `"https://onthemap-api.udacity.com/v1/StudentLocation"`

## implemntation

- we need to make 2 reqists 
  - one for login session 👇
  
  <img width="916" alt="Screen Shot 2019-07-19 at 8 24 36 PM" src="https://user-images.githubusercontent.com/40995452/61553575-5bca9c80-aa63-11e9-9f8a-174dd51e0758.png">
  
  
  - the athor for posting student location👇
  
  
 <img width="880" alt="Screen Shot 2019-07-19 at 8 24 51 PM" src="https://user-images.githubusercontent.com/40995452/61553581-5cfbc980-aa63-11e9-8bac-d8a1e73a5ba0.png">

  
  
  
- Then mapviewView Controller to desply all the student locations like `MapViewController`
- after that view controler adding new pin. Here i make it 2 step prosess as folow : 
  - first viewcontroller alows the user to write locaton and linkedin link 👇 `Addlocation`
  
  <img width="441" alt="Screen Shot 2019-07-19 at 7 03 39 PM" src="https://user-images.githubusercontent.com/40995452/61549988-16ee3800-aa5a-11e9-8ba0-ed54279e776b.png">
  
  - Then mapView controller to preview the location and adding it or cancel it 👇 `AddLocationPart2`
  
  <img width="454" alt="Screen Shot 2019-07-19 at 7 04 27 PM" src="https://user-images.githubusercontent.com/40995452/61549990-19e92880-aa5a-11e9-9096-e655fe6a8e9e.png">

   
  
## Requirements 

- xcode 10
- Swift 5
- udacity Account 

## Copyright 

Copyright (c) 2019 Norah Alshareef
