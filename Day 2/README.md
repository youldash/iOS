# Day 2: Collections and Enumerations

[![Twitter Follow](https://img.shields.io/twitter/follow/youldash.svg?style=social?style=plastic)](https://twitter.com/youldash)
[![Twitter Follow](https://img.shields.io/twitter/follow/UQU_CS.svg?style=social?style=plastic)](https://twitter.com/UQU_CS)

## Terms of Use

By using this site, you agree to the **Terms of Use** that are defined in [LICENSE.md](https://github.com/youldash/iOS/blob/master/LICENSE.md).

## Outline

In this part of the course, you will be introduced to Collection generics (i.e. Arrays, Sets, Dictionaries, etc.). Once you've fully grasped the idea of instantiating factory Collection factory classes (e.g. `NSArray`, `NSMutableArray`) in your projects, you will be instructed to implement a number of exercises related to creating custom Collection classes. These of which are necessary for establishing the building blocks for the final Scene Graph product.

## Exercise 3: Arrays

In this exercise, you will develop a Foundation tool using Xcode. This example shows how to create a custom `Array` class that would behave similarly to an `NSMutableArray` factory class.

> **Pro Tip:** Since the work that will be accomplished here will assist in the development of the final Scene Graph iOS app, we will consider naming conventions every time we create new classes, from this point onwards. This implies that every class name should start with an identifiable prefix. For instance, factory classes use the `NS` prefix (which stands for **Next Step**). Because our ultimate goal is to develop a Scene Graph app that will be named **Grapher**, we might as well consider the first two letters to form our unique prefix: `GR`.

* Create a new project by launching Xcode (under the "/Applications" folder if you installed Xcode by downloading it directly from the App Store), and selecting "New Project" from the File menu.

* Under the "OS X" section, select "Application", and choose “Command Line Tool”, then Next.
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise3.0.1.png" width="100%" /></div>

* When prompted for options, type "Arrays" as the Product Name.

* Confirm that your Bundle Identifier looks like `sa.edu.uqu.cis.Arrays`. This can be done by typing a reverse DNS string for Umm Al-Qura's College (`sa.edu.uqu.cis`) in the Organization Identifier field.

* Choose "Objective-C" from the Language pop-up menu.

* Leave the Use Automatic Reference Counting checkbox checked (as it exists in earlier releases of Xcode).

* Confirm the final steps by clicking Next, then creating and saving the project to disk. You may wish to leave "Create Git repository on" checked and "My Mac" selected. This feature allows you to create and manage different versions of your project using a bundled Git repository, as follows:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise3.0.2.png" width="100%" /></div>

* Xcode then creates your project.
