# Day 3: Scene Graphs (Part I)

[![Twitter Follow](https://img.shields.io/twitter/follow/youldash.svg?style=social?style=plastic)](https://twitter.com/youldash)
[![Twitter Follow](https://img.shields.io/twitter/follow/UQU_CS.svg?style=social?style=plastic)](https://twitter.com/UQU_CS)

## Terms of Use

By using this site, you agree to the **Terms of Use** that are defined in [LICENSE.md](https://github.com/youldash/iOS/blob/master/LICENSE.md).

## Outline

Over the course of this day, you will be introduced to other topics pertaining to the construction of Scene Graphs. In particular, we will explain how the [work in the previous three exercises ](https://github.com/youldash/iOS/blob/master/Day%202/) can be incorporated into a much bigger component. That is, forming the Nodes and Edges of a Graph, along with other vital components that allow such Graphs to be constructed, enumerated, and queried.

In practice, you will start building your final Scene Graph iOS app starting from **Exercise 6**. As you start, we will guide you through the necessary steps for configuring your app to gradually accept new components, test them out, and to move on to the final phases of your app development lifecycle.

## Exercise 6: Enumerators and Enumerables

* Create a new project by launching Xcode, and selecting "New Project" from the File menu.

* Under the "iOS" section, select "Application", and choose the "Game" template, then Next.
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise6.0.1.png" width="100%" /></div>

* When prompted for options, enter "Grapher" in the Product Name field (which is the final product outcome of this training course).

* Use a reverse DNS in the Organization Identifier field. For example, the chosen reverse DNS string for Umm Al-Qura's College URL is `sa.edu.uqu.cis`. Then, confirm the Bundle Identifier ends up looking like `sa.edu.uqu.cis.Grapher`.

* Choose "Objective-C" from the Language pop-up menu.

* Make sure you select "SpriteKit" from the Game Technology pop-up menu.

> **App Frameworks:** The "Game" technology template is a good starting point for developing apps that heavily depend on extensive graphics drawings and animations as their output. With Xcode you have the ability to develop graphics-rich apps using (at least one, or more than one in advanced cases) of the following four app frameworks: **SceneKit**, **SpriteKit**, **OpenGL ES** and finally, **Metal**. For simplicity, it is best to incorporate the [SpriteKit Framework](https://developer.apple.com/library/ios/documentation/SpriteKit/Reference/SpriteKitFramework_Ref/) in your project, as it is suitable for rendering two-dimensional (2D) Graph-based primitives like Nodes and Edges, and beyond. Of course all of this will make sense in later parts of this training course as you continue from this point onwards :)
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise6.0.2.png" width="100%" /></div>

* Leave the Include Unit Tests and Include UI Tests checkboxes unchecked (as they are not necessary for this part of the exercises).

* Depending on which Apple platform your is targeting, you should carefully consider either "iPhone", "iPad", or "Universal" from the Devices pop-up menu. By selecting "Universal" you allow your app to run on all iOS devices whilst making sure that the look and feel of your app is dynamically adjusted to the chosen platform.

> **Note:** Since the exercises will be deployed on an iPad that will be brought during the course of the workshop, we will assume you have already chosen "iPad" form the Devices pop-up menu. Selecting which device to target and working on the design aspects of your project will be entirely up to you.

* Confirm the final steps by clicking Next, You may wish to leave "Create Git repository on" checked and "My Mac" selected:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise6.0.3.png" width="100%" /></div>
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise6.0.4.png" width="100%" /></div>

* Choose somewhere on your drive to save your project, and click Create. Xcode then creates your project, and it should look something like so:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise6.0.5.png" width="100%" /></div>



## What's Next?

**Congratulations!** You are now ready to tackle the challenges introduced in [Day 4: Scene Graphs (Part II)](https://github.com/youldash/iOS/blob/master/Day%204/).
