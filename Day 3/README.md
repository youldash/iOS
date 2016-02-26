# Day 3: Scene Graphs (Part I)

[![Twitter Follow](https://img.shields.io/twitter/follow/youldash.svg?style=social?style=plastic)](https://twitter.com/youldash)
[![Twitter Follow](https://img.shields.io/twitter/follow/UQU_CS.svg?style=social?style=plastic)](https://twitter.com/UQU_CS)

## Terms of Use

By using this site, you agree to the **Terms of Use** that are defined in [LICENSE.md](https://github.com/youldash/iOS/blob/master/LICENSE.md).

## Outline

Over the course of this day, you will be introduced to other topics pertaining to the construction of Scene Graphs. In particular, we will explain how [the work in the previous three exercises ]((https://github.com/youldash/iOS/blob/master/Day%202/)) can be incorporated into a much bigger component. That is, forming the Nodes and Edges of a Graph, along with other vital components that allow such Graphs to be constructed, enumerated, and queried.

In practice, you will start building your final Scene Graph iOS app starting from **Exercise 6**. As you start, we will guide you through the necessary steps in configuring your app to gradually accept new components, test them out, and to move on to the final phases of the app development lifecycle.

## Exercise 6: Enumerators and Enumerables

* Create a new project by launching Xcode, and selecting "New Project" from the File menu.

* Under the "iOS" section, select "Application", and choose the "Game" template, then Next.
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise6.0.1.png" width="100%" /></div>

* When prompted for options, type "Grapher" as the Product Name (which is the final product name of your iOS training course).

* You may consider leaving the Organization Identifier field as is by default (which is allowed in previous major releases of Xcode), or use a reverse DNS (Domain Name System). Here, the chosen reverse DNS string for Umm Al-Qura's College URL looks like `sa.edu.uqu.cis`. By doing so, you should confirm the Bundle Identifier to look like `sa.edu.uqu.cis.Grapher`.

* Choose "Objective-C" from the Language pop-up menu.

* Leave the Include Unit Tests and Include UI Tests checkboxes unchecked (as they are not necessary for this part of the exercises).

* Depending on which Apple platform your is targeting, you should carefully consider either "iPhone", "iPad", or "Universal" from the Devices pop-up menu. By selecting "Universal" you allow your app to run on all iOS devices whilst making sure that the look and feel of your app is dynamically adjusted to the chosen platform.

> **Note:** Since the exercises will be deployed on an iPad that will be brought during the course of the workshop, we will assume you have already chosen "iPad" form the Devices pop-up menu. Selecting which device to target and working on the design aspects of your project will be entirely up to you.

* Confirm the final steps by clicking Next, then creating and saving the project to disk. You may wish to leave "Create Git repository on" checked and "My Mac" selected:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise6.0.2.png" width="100%" /></div>
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise6.0.3.png" width="100%" /></div>

* Xcode then creates your project. It should look something like so:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise6.0.4.png" width="100%" /></div>



## What's Next?

**Congratulations!** You are now ready to tackle the challenges introduced in [Day 4: Scene Graphs (Part II)](https://github.com/youldash/iOS/blob/master/Day%204/).
