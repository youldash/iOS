# iOS Developer Essentials

Brought to you by:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/CS%20B.png" width="50%" /></div>

[![Twitter Follow](https://img.shields.io/twitter/follow/youldash.svg?style=social?style=plastic)](https://twitter.com/youldash)
[![Twitter Follow](https://img.shields.io/twitter/follow/UQU_CS.svg?style=social?style=plastic)](https://twitter.com/UQU_CS)

## About

You have made it to the iOS developer essentials workshop repo! Congratulations :)

This workshop (or course if you will) is an intensive 5-day event, which is designed for UQU college students whom are proficient with any modern, Object-Oriented language like Java and C++. **Attendees must have a solid (sound) understanding of Object-Oriented principles prior entry into the course.**

Attendees will receive 5-full days of training on campus (with sessions varying from 3- to 4-hours depending on the allocated schedule, which will be allocated by the Department).

Attendees are **highly recommended** to bring their own Apple laptops, running the [latest public release of the Xcode development software](https://itunes.apple.com/au/app/xcode/id497799835?mt=12). As this course is specifically designed to cover many topics in a (rather) short period, we recommended that every participant should gain access to (at least) a private Mac computer at their own pace, and gain practical expertise by learning additional topics not covered during the course.

Over the course of training, participants will be asked to signup (using this site) and create new (free) accounts that could be used for collaboration, and mainly, for submitting assignment work to the instructor (for further assessment). This process is the only accepted method for completing each announced task/assignment.

> **Important:** **Certificates of Completion** will be granted to attendees, upon the successful completion of tasks that will be announced during the event. **Certificates for Attendance** on the other hand, will not be issued, to guarantee the full benefit of training, participation, and collaboration during the course of the workshop.

> For more updates please follow [@UQU_CS](https://twitter.com/UQU_CS) on Twitter.

## Welcome!

> Our mission is to provide high-quality training and education for both of our highly-valued [UQU](http://www.uqu.edu.sa) student (for both genders), to open up new horizons and new career pathways for out beloved students, to establish innovative ideas, and to offer professional services to the Saudi community as a whole. This includes preparing students to be leaders in their profession, creating and disseminating knowledge by means of scholarly and creative achievements, and by establishing partnerships with the local Saudi industry, governmental organizations and leading international academic institutions (both domestic and overseas).

**Sultan Almutairi, Ph.D.**
**Assistant Professor in Cyber Security**
**Head of Computer Science Department at UQU**
**[@sultan_motiri](https://twitter.com/UQU_CS)**

## Preface

The app-making process for the iOS ecosystem relies on a special, yet easy to learn paradigm for creating mobile apps. Developers are challenged to provide their users with fun, joyful, and memorable experiences.

In this workshop, we present Apple's approach to building a a fully-fledged [Scene Graph](https://en.wikipedia.org/wiki/Scene_graph) iOS app. A **Scene Graph** is a general [Data Structure](https://en.wikipedia.org/wiki/Data_structure) that is commonly used by vector-based graphics editing apps like [Adobe Illustrator](http://www.adobe.com/products/illustrator.html) and [AutoCAD](http://www.autodesk.com/products/autocad/overview), and modern computer games of our time. These apps often arrange both logical and spatial representations of a graphical scene using specific **Graph** structure elements: **Nodes** and **Edges**.

> Your app will be capable of establishing **two-dimensional Graph instances** in a **dynamic fashion**. In other words, your app will be able to interactively construct the Node and Edge elements of a typical Scene Graph, while arranging their spacial positions using "touch" as the primary method of input.

The final product should look similarly to the following iPad mockup (or screenshot):
![Screenshot](https://raw.github.com/youldash/iOS/master/Misc/ScreenshotLandscape.png)

### Course Syllabus

* Bringing ideas to life.
* Learn about the "3 Ts" of iOS app development.
* Explore the iOS SDK (Software Development Kit).
* How to leverage the Xcode IDE (Integrated Development Environment) to its full potential.
* Leverage the power of collection classes such as `NSArray`, `NSSet`, `NSDictionary`, and other user-defined classes.
* Understand the concepts of navigation using the `UINavigationController` class, and Segues.
* Understand how to store, handle, and present Scene Graph information orderly using the `SpriteKit` API (Application Programming Interface).
* Understand how to make your app more appealing using Audio (specifically with `AVFoundation`).
* Perform various operation using both Main and Background threads of an app.
* Start developing your iOS app with confidence.

### Course Structure

* [Day 1: Induction](https://github.com/youldash/iOS/blob/master/Day%201/).
* [Day 2: Uni- and Multi-dimensional Arrays](https://github.com/youldash/iOS/blob/master/Day%202/).
* [Day 3: Scene Graphs (Part I)](https://github.com/youldash/iOS/blob/master/Day%203/).
* [Day 4: Scene Graphs (Part II)](https://github.com/youldash/iOS/blob/master/Day%204/).
* [Day 5: Scene Graphs (Part III)](https://github.com/youldash/iOS/blob/master/Day%205/).

This course structure is **further broken down** into **10 unique tasks** (with each one depending on the completion of its predecessor):

* Exercise [1](https://github.com/youldash/iOS/tree/master/Day%201#exercise-1-photography-10) → Building atomic components using Xcode's Command Line Utility for testing and debugging, and for later insertion into bigger projects.
* Exercise [2](https://github.com/youldash/iOS/tree/master/Day%201#exercise-2-photography-20) → Building your very first iOS app for populating output based on your previous components through simple UI. In this exercise, we further elaborate on the ideas behind the MVC (Model View Controller) design pattern, and how it can be adopted with Xcode.
* Exercises [3](https://github.com/youldash/iOS/tree/master/Day%202#exercise-3-arrays) through [5](https://github.com/youldash/iOS/tree/master/Day%202#exercise-5-multidimensional-arrays) → Constructing custom Collection classes (i.e. both Unidimensional and Multidimensional Array facades) as important components for future tasks.
* Exercise [6](https://github.com/youldash/iOS/tree/master/Day%203#exercise-6-enumerators-and-enumerables) → Establishing the foundations of your final iOS app.
* Exercise [7](https://github.com/youldash/iOS/tree/master/Day%203#exercise-7-containers) → Building the skeleton code for Scene Graphs.
* Exercise [8 (Part I)](https://github.com/youldash/iOS/tree/master/Day%203#exercise-8-scene-graph-nodes-and-edges) → Constructing the Nodes of your Scene Graphs.
* Exercise [8 (Part II) ](https://github.com/youldash/iOS/tree/master/Day%204#exercise-8-scene-graph-nodes-and-edges-continueds) → Constructing the Edges and Graph facades, in addition to constructing both Node and Edge enumerator and enumerable utility classes.
* Exercise [9](https://github.com/youldash/iOS/tree/master/Day%204#exercise-9-enumerating-scene-graph-objects) → Building Enumerator-based classes for iterating Scene Graph objects.
* Exercises [10](https://github.com/youldash/iOS/tree/master/Day%205#exercise-10-modifying-your-scene-class) and [11](https://github.com/youldash/iOS/tree/master/Day%205#exercise-11-modifying-your-viewcontroller-class) → Refining your Scene and ViewController to handle user input, Graph creation, and audio feedback.
* Exercise [12](https://github.com/youldash/iOS/tree/master/Day%205#exercise-12-importing-media-assets) → Importing media assets into your project to make your final app more appealing.
* Exercise [13](https://github.com/youldash/iOS/tree/master/Day%205#exercise-13-localizing-your-app) → Localizing your app to (mainly) display Arabic text phrases.

## Disclaimer

While every effort has been made by Umm Al-Qura University to ensure that the information in this publication is up to date and accurate, Umm Al-Qura University does not give any guarantees, undertakings or warranties in relation to the accuracy, completeness and up to date status of the above information.

Umm Al-Qura University will not be liable for any loss or damage suffered by any person arising out of the reliance of any information in this publication.

Umm Al-Qura University accepts no responsibility or liability for the content available at any of the web sites referred to in this publication.

## Trademark

, Mac, OS X, iOS, and Xcode, are trademarks of Apple, Inc.

## Sponsors

<div align="center">
	<table border="0">
		<tr>
			<td align="center"><img src="https://raw.github.com/youldash/NCCC/master/misc/UQU-LOGO-1024x731.png" width="50%" /></td>
			<td align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/TAM.png" width="100%" /></td>
		</tr>
	</table>
</div>

This repo was made possible, thanks to:
- [Department of Computer Science](http://cis.uqu.edu.sa/) of Umm Al-Qura University, Mecca, Saudi Arabia.
- [Tam Development, LLC](http://tam.sa/).

## License

This Git repo is published under the Creative Commons Attribution-NonCommercial 4.0 International License. By using this site, you agree to the **Terms of Use** that are defined in [LICENSE.md](https://github.com/youldash/iOS/blob/master/LICENSE.md).
