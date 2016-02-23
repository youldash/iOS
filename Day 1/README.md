# Day 1: Induction

[![Twitter Follow](https://img.shields.io/twitter/follow/youldash.svg?style=social?style=plastic)](https://twitter.com/youldash)
[![Twitter Follow](https://img.shields.io/twitter/follow/UQU_CS.svg?style=social?style=plastic)](https://twitter.com/UQU_CS)
[![Twitter Follow](https://img.shields.io/twitter/follow/UQUCS_F.svg?style=social?style=plastic)](https://twitter.com/UQUCS_F)

## Terms of Use

By using this site, you agree to the **Terms of Use** that are defined in [LICENSE.md](https://github.com/youldash/iOS/blob/master/LICENSE.md).

## Outline

> ***Update:*** This repo is under construction at the moment. For more updates please follow [@UQU_CS](https://twitter.com/UQU_CS) and [@UQUCS_F](https://twitter.com/UQUCS_F) on Twitter.

## A "Little Thing" About Passion

Have you ever thought of an idea that is going to be the "Next Big Thing", but you don't know where to start? … If this is the case, you're definitely in the right spot. The most important part of creativity is coming up with ideas, and mobile apps are no exception. Whether it be from seeing apps that are already in the App Store, thinking of a good solution to a problem you face, or simply thinking something would be cool are all great reasons to develop an app.

<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Lamp.png" width="25%" /></div>

Being passionate about your idea is going to carry you through the process. If you're not passionate, you're going to burn out. 
From a business perspective,  you view at all ideas in the app world through the lens of earning money. There are very few people out there that want to spend a lot of their own cash on something that's just cool, and this isn't for them. This is about making sure your idea is not only good, but will win, and last long in the app market.

In traditional business models, there are two general areas of success. Either you innovate something that no one else did, or you simply beat the competition by becoming better.

As you become very passionate about your idea, and discuss it with others, it is very important to make sure it's bulletproof from the start. For this, you should definitely ask your self this:

> **What makes your idea special?**

On this note, you need to remember that an app, or "solution", needs to be special in some way. This can be achieved through the following:

* **Featuring** -- "Navigating though screens using swipe gestures instead of tapping."
* **Designing** -- "Making a weather app with animated backgrounds."
* **Storytelling** -- "Cataloging the story of an inspiring person and sharing it with others."
* **Marketing** -- "Signing up with a company with millions of fans like Facebook, Instagram, Twitter, Pinterest, Snapchat, and others."

As a final remark, try coming up with an idea that means something to you. Anyone today can think of good ideas, and only a handful present great ideas to the world. So, try thinking of something that is truly "awesome" in a sense.

## Exercise 1: Photography 1.0

In this exercise, you will develop a Photography application as a Foundation tool using Xcode. This example shows how to create a `Photo` class that forms the basis of a `PhotoAlbum` class using containers.

> **Pro Tip:** Working with command line projects often grants you experience in developing smaller packages and managing them with Xcode. Such packages can be reused later on in bigger, more complex projects or workspaces.

* Create a new project by launching Xcode (under the "/Applications" folder if you installed Xcode by downloading it directly from the App Store), and selecting "New Project" from the File menu.
* Under the Mac OS X section, select "Application", and choose “Command Line Tool”, then Next.
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Photography1.0.1.png" width="100%" /></div>

* When prompted for options, type "Photography" as the Product Name. You may consider leaving the Company Identifier field as is by default, or use a reverse DNS (Domain Name System). For instance, if you take a look at the College of Computer and Information Systems' domain name "http://cis.uqu.edu.sa", then its reverse DNS string should look like "sa.edu.uqu.cis". The Bundle Identifier will be set automatically, which is used for identifying your app in the App Store.

* Choose "Foundation" from the Type pop-up menu. By doing so, you allow your code to be linked to the Foundation Framework that holds all the necessary handlers for defining simple data types like NSObject and others.

* Leave the Use Automatic Reference Counting checkbox checked (as it exists in earlier releases of Xcode).
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Photography1.0.2.png" width="100%" /></div>

* Confirm the final steps by clicking Next, then creating and saving the project to disk. You may wish to leave "Create Git repository on" checked and "My Mac" selected. This feature allows you to create and manage different versions of your project using a bundled Git repository, as follows:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Photography1.0.3.png" width="100%" /></div>

Xcode then creates your project. It should look something like this:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Photography1.0.4.png" width="100%" /></div>

To bring more insight into the Xcode IDE, a snapshot from Xcode's documentation files is borrowed for illustration:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/IDE.png" width="75%" /></div>

* Try hiding both Utility and Debug areas, and only show both Editor and Navigation areas. This may help you focus on code you manage and keeps from getting distracted by other elements that might not be of relevance to the current project, like so (never mind the color scheme):
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Photography1.0.5.png" width="100%" /></div>

* Add a new class by highlighting on the "Photography" yellow (group) folder and selecting "New File" from the File menu.

* Under the "OS X" section, select "Source", and choose "Cocoa Class" as follows:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Photography1.0.6.png" width="100%" /></div>

* When prompted for options, type "Photo" as the class name. Make sure "NSObject" is selected for subclassing from, like so:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Photography1.0.7.png" width="100%" /></div>

* Confirm by clicking Next and make sure "Targets" is checked for the executable. This step will add both header file "Photo.h" and the implementation file "Photo.m" to your project.
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Photography1.0.8.png" width="100%" /></div>

* Type the code snippet listed below into Photo.h. This class represents the building block for creating address cards as part of an photo album, which will be created later as a separate class:

``` Objective-C
@import Foundation;

@interface Photo : NSObject

/**
 *  A caption.
 */
@property NSString *caption;

/**
 *  A photographer.
 */
@property NSString *photographer;

@end
```

## Exercise 2: Photography 2.0

Work in progress...

## Exercise 3: Photography 3.0

Work in progress...
