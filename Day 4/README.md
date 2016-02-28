# Day 4: Scene Graphs (Part II)

[![Twitter Follow](https://img.shields.io/twitter/follow/youldash.svg?style=social?style=plastic)](https://twitter.com/youldash)
[![Twitter Follow](https://img.shields.io/twitter/follow/UQU_CS.svg?style=social?style=plastic)](https://twitter.com/UQU_CS)

## Terms of Use

By using this site, you agree to the **Terms of Use** that are defined in [LICENSE.md](https://github.com/youldash/iOS/blob/master/LICENSE.md).

## Outline

Over the course of this day, you will be introduced to other topics pertaining to the construction of Scene Graphs. In particular, we will explain how the [work in the previous three exercises ](https://github.com/youldash/iOS/blob/master/Day%202/) can be incorporated into a much bigger component. That is, forming the Nodes and Edges of a Graph, along with other vital components that allow such Graphs to be constructed, enumerated, and queried.

In practice, you will start building your final Scene Graph iOS app starting from **Exercise 6**. As you start, we will guide you through the necessary steps for configuring your app to gradually accept new components, test them out, and to move on to the final phases of your app development lifecycle.

## Exercise 8: Scene Graph Nodes and Edges (Continued)

As the title suggests, Nodes and Edges are both considered vital building blocks of any Graph facade.

> **Important!** This part of the exercise assumes you've successfully completed all tasks in [Exercise 8 from yesterday](https://github.com/youldash/iOS/tree/master/Day%203#exercise-8-scene-graph-nodes-and-edges). If that isn't the case, then we **strongly recommend** that you complete them first prior attempting the tasks that are presented here.

### The Edge Class

* Add a new class by highlighting on the "Grapher" yellow icon and selecting "New File" from the File menu.

* Under the "OS X" section, select "Source", and choose "Cocoa Class".

* When prompted for options, type `GREdge` as the class name. Make sure the `SKShapeNode` superclass is selected for it.

> **Pro Tip:** Like `GRNode`, the `SKShapeNode` class is the ideal candidate for drawing custom shapes defined by a the app's graphics path context. In our context, `SKShapeNode` will be used for defining the shape of a typical Edge data structure. See the [SKShapeNode Class Reference](https://developer.apple.com/library/ios/documentation/SpriteKit/Reference/SKShapeNode_Ref/index.html#//apple_ref/occ/cl/SKShapeNode) for more information on how to properly use it in your SpriteKit projects.

* Choose "Objective-C" from the Language pop-up menu, like so:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise8.0.13.png" width="100%" /></div>

* Confirm by clicking Next and make sure "Targets" is checked for the executable. As you hit Create, you will immediately add both interface and implementation files `GREdge.[h,m]` to your project.



> **Note:** Xcode project files for this exercise will be pushed to this repo, later.

## What's Next?

**Congratulations!** You are now ready to tackle the final challenges presented in [Day 5: Scene Graphs (Part III)](https://github.com/youldash/iOS/blob/master/Day%205/).


