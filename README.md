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

`https://github.com/Norah-ALShareef/Virtual-Tourist-Udacity-FinalProject.git`

- creat an account on [Flikr](https://www.flickr.com)

## implemntation

This project containe 3 ViewControolers : 
- `mainPage(MapView).swift` This view contain mapKit function and FetchedResult functions onse the user taps the location `IBAction` will call it function and adds a pin to the map onse that pin has been taped it will perform the Fetched and move to the `photoSelectedLocationColectionView`.
- `photoSelectedLocationColectionView` Here tha magic will happen two Fetche function has been performed `NSFetchedResultsController<Photo>!` &  `NSFetchedResultsController<Pin>!` and collectionViw functions to show the pics  related to the pin and delet thim.
- `NeViewController`  same as photoSelectedLocationColectionView MapView here allows the user to preview the pic from pins  

## Requirements 

- xcode 10
- Swift 5
- flickr Key

## Copyright 

Copyright (c) 2019 Norah Alshareef
