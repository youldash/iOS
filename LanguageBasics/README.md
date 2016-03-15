# Language Basics 

[![Twitter Follow](https://img.shields.io/twitter/follow/youldash.svg?style=social?style=plastic)](https://twitter.com/youldash)
[![Twitter Follow](https://img.shields.io/twitter/follow/UQU_CS.svg?style=social?style=plastic)](https://twitter.com/UQU_CS)
[![Twitter Follow](https://img.shields.io/twitter/follow/UQUCS_F.svg?style=social?style=plastic)](https://twitter.com/UQUCS_F)

## Terms of Use

By using this site, you agree to the **Terms of Use** that are defined in [LICENSE.md](https://github.com/youldash/iOS/blob/master/LICENSE.md).

## Outline

In this part of the training course, we will introduce you to an extra project that will facilitate the idea of making both **class** and **instance** methods...

> **See:** The accompanying ["Graphs" Xcode Command Line Tool](https://github.com/youldash/iOS/tree/master/Bonus/Graphs) for a complete example ([download the Zip archive](https://github.com/youldash/iOS/tree/master/Bonus/Graphs.zip)).

> **See:** The accompanying ["App" Xcode iOS project](https://github.com/youldash/iOS/tree/master/Bonus/App) for a simple example on alert views ([download the Zip archive](https://github.com/youldash/iOS/tree/master/Bonus/App.zip)).

> **See:** The accompanying ["Rectangle" Xcode Command Line Tool](https://github.com/youldash/iOS/tree/master/Bonus/App) for a simple refresher example on coding basics (as requested by students) ([download the Zip archive](https://github.com/youldash/iOS/tree/master/Bonus/Rectangle.zip)).

> **See:** The accompanying ["AlbumApp" iOS TableView project](https://github.com/youldash/iOS/tree/master/Bonus/App) for an iOS TableView example ([download the Zip archive](https://github.com/youldash/iOS/tree/master/Bonus/AlbumApp.zip)).

## Compiling "FlowerShop 4.0"

* Compile and run the program by clicking on the Run button (located on the top-left corner of Xcode), or by pressing (⌘ + R). You should see an outcome similar to the following Debugger output:

```
2016-03-15 10:35:34.281 FlowerShop[869:12456] FlowerShop unit test program.
2016-03-15 10:35:34.284 FlowerShop[869:12456] --------------------------------------------
2016-03-15 10:35:34.285 FlowerShop[869:12456] -[FlowerShopTester flowerShop:willAddFlower:]: <Flower: name=Flower, number=0, price=$10.00, image=(null)]>
2016-03-15 10:35:34.285 FlowerShop[869:12456] -[FlowerShopTester flowerShop:didAddFlower:]: <Flower: name=Flower, number=0, price=$10.00, image=(null)]>
2016-03-15 10:35:34.286 FlowerShop[869:12456] Sold? YES
2016-03-15 10:35:34.286 FlowerShop[869:12456] -[FlowerShopTester flowerShop:willAddFlower:]: <Flower: name=Garden Rose, number=0, price=$79.99, image=(null)]>
2016-03-15 10:35:34.286 FlowerShop[869:12456] -[FlowerShopTester flowerShop:didAddFlower:]: <Flower: name=Garden Rose, number=1, price=$79.99, image=(null)]>
2016-03-15 10:35:34.286 FlowerShop[869:12456] -[FlowerShopTester flowerShop:willAddFlower:]: <Flower: name=Iris, number=0, price=$139.99, image=(null)]>
2016-03-15 10:35:34.287 FlowerShop[869:12456] -[FlowerShopTester flowerShop:didAddFlower:]: <Flower: name=Iris, number=2, price=$139.99, image=(null)]>
2016-03-15 10:35:34.362 FlowerShop[869:12456] Using a normal for-loop...
2016-03-15 10:35:34.363 FlowerShop[869:12456] 0 Name: Flower
2016-03-15 10:35:34.363 FlowerShop[869:12456] 0 Number: 0
2016-03-15 10:35:34.363 FlowerShop[869:12456] 0 Price: $10.00
2016-03-15 10:35:34.363 FlowerShop[869:12456] 0 Image: (null)
2016-03-15 10:35:34.363 FlowerShop[869:12456] 1 Name: Garden Rose
2016-03-15 10:35:34.364 FlowerShop[869:12456] 1 Number: 1
2016-03-15 10:35:34.364 FlowerShop[869:12456] 1 Price: $79.99
2016-03-15 10:35:34.364 FlowerShop[869:12456] 1 Image: (null)
2016-03-15 10:35:34.364 FlowerShop[869:12456] 2 Name: Iris
2016-03-15 10:35:34.364 FlowerShop[869:12456] 2 Number: 2
2016-03-15 10:35:34.365 FlowerShop[869:12456] 2 Price: $139.99
2016-03-15 10:35:34.365 FlowerShop[869:12456] 2 Image: (null)
2016-03-15 10:35:34.365 FlowerShop[869:12456] Removed "gardenRose"...
2016-03-15 10:35:34.365 FlowerShop[869:12456] Using a normal for-loop...
2016-03-15 10:35:34.366 FlowerShop[869:12456] 0 Name: Flower
2016-03-15 10:35:34.445 FlowerShop[869:12456] 0 Number: 0
2016-03-15 10:35:34.445 FlowerShop[869:12456] 0 Price: $10.00
2016-03-15 10:35:34.445 FlowerShop[869:12456] 0 Image: (null)
2016-03-15 10:35:34.446 FlowerShop[869:12456] 1 Name: Iris
2016-03-15 10:35:34.446 FlowerShop[869:12456] 1 Number: 2
2016-03-15 10:35:34.446 FlowerShop[869:12456] 1 Price: $139.99
2016-03-15 10:35:34.446 FlowerShop[869:12456] 1 Image: (null)
Program ended with exit code: 0
```
