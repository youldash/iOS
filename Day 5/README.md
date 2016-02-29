# Day 5: Scene Graphs (Part III)

[![Twitter Follow](https://img.shields.io/twitter/follow/youldash.svg?style=social?style=plastic)](https://twitter.com/youldash)
[![Twitter Follow](https://img.shields.io/twitter/follow/UQU_CS.svg?style=social?style=plastic)](https://twitter.com/UQU_CS)

## Terms of Use

By using this site, you agree to the **Terms of Use** that are defined in [LICENSE.md](https://github.com/youldash/iOS/blob/master/LICENSE.md).

## Outline

Over the course of this workshop, we have shown you how to accomplish:

* Exercise [1](https://github.com/youldash/iOS/tree/master/Day%201#exercise-1-photography-10) → Build smaller (atomic) components using Xcode's Command Line Utility for testing them out separately before adding them into the bigger picture.
* Exercise [2](https://github.com/youldash/iOS/tree/master/Day%201#exercise-2-photography-20) → Build your very first iOS app that tested your previous atomic components through simple UI. In this exercise, we have also shown you how the MVC (Model View Controller) design paradigm was put into action (by separating your logic  code from both UI and controller classes).
* Exercises [3](https://github.com/youldash/iOS/tree/master/Day%202#exercise-3-arrays) through [5](https://github.com/youldash/iOS/tree/master/Day%202#exercise-5-multidimensional-arrays) → Construct custom Collection classes (i.e. both Unidimensional and Multidimensional Array facades) as atomic components for later use in proceeding tasks.
* Exercise [6](https://github.com/youldash/iOS/tree/master/Day%203#exercise-6-enumerators-and-enumerables) → Establish the foundations of your final iOS app (and modifying it to suite our needs). In addition to adding a few extra enumerable/iterative components (including their enumerators).
* Exercise [7](https://github.com/youldash/iOS/tree/master/Day%203#exercise-7-containers) → Build the skeleton code (using the Container class) for building Scene Graphs.
* Exercise [8 (Part I)](https://github.com/youldash/iOS/tree/master/Day%203#exercise-8-scene-graph-nodes-and-edges) → Construct the Nodes of your Scene Graphs.
* Exercise [8 (Part II) ](https://github.com/youldash/iOS/tree/master/Day%204#exercise-8-scene-graph-nodes-and-edges-continueds) → Construct the Edges and actual Graph facades of your Scene Graph app. The exercise also included a few tasks for constructing both Node and Edge enumerator and enumerable utility classes.
* Exercise [9](https://github.com/youldash/iOS/tree/master/Day%204#exercise-9-enumerating-scene-graph-objects) → Build the skeleton code (using the Container class) for building Scene Graphs.

In this final part, we will take you through the necessary steps for putting everything you've built together, along with a number of important steps for making your final product more appealing, and user responsive.

## Exercise 10: Modifying Your Scene Class

As the title suggests, you will be guided through a series of steps for making you Scene class handle user input and a such, you will have the ability in creating "labelled" Graph Nodes and connect them with Edges (using touch).

> **Note:** For the initial Nodes, we will assume that no Edges will be created for it. However for every consecutive touch, additional Nodes will be added to your Scene Graph, as they will be automatically connected through "labelled" Edges. Each Edge will display the computed distance/weight in a 2D Cartesian [(Euclidean)](https://en.wikipedia.org/wiki/Euclidean_distance) confined space.

* Edit your `GRScene.h` header from within the Editor area of Xcode and modify what is currently there using the following two code snippets as your guide. They contain both protocol and class interface declarations for defining the behavior of your Scenes, respectively:

``` Objective-C
@import SpriteKit;

#import "GRAbstractGraph.h"

@class GRScene;

/**
 *  Provides an interface for various scene graph calls.
 */
@protocol GRSceneDelegate <NSObject>

/**
 *  Scene graph did add a new node to its graph.
 *
 *  @param  scene  A Grapher scene associated with this edge.
 *  @param log  A log.
 */
- (void)scene:(GRScene *)scene addedNodeWithLog:(NSMutableString *)log;

/**
 *  Scene graph did purge its graph.
 *
 *  @param  scene  A Grapher scene associated with this edge.
 *  @param log  A log.
 */
- (void)scene:(GRScene *)scene purgedGraphWithLog:(NSMutableString *)log;

@end
```

``` Objective-C
/**
/**
 *  Provides an interface for playing around with interactive graph data structures.
 */
@interface GRScene : SKScene

#pragma mark -
#pragma mark Accessing

/**
 *  A Grapher scene delegate.
 */
@property (weak, nonatomic) id<GRSceneDelegate> sceneDelegate;

/**
 *  An undirected graph.
 */
@property (strong, nonatomic) id<GRGraphDelegate> graph;

/**
 *  The maximum number of nodes.
 */
@property (readwrite, nonatomic) NSUInteger length;

/**
 *  Logging.
 */
@property (copy, nonatomic) NSMutableString *log;

/**
 *  Indexing.
 */
@property (readwrite, nonatomic) NSUInteger idx;

@end
```

* Your `GRScene` implementation file is now ready for some tweaks. Continue by editing the corresponding `GRScene.m` file and adding the following import statements (under `#import "GRScene.h"`), along with the property synthesizer stub for your Scene properties:

``` Objective-C
#import "GRSceneGraph.h"
#import "GRNode.h"
#import "GREdge.h"
```

``` Objective-C
#pragma mark -
#pragma mark Accessing

/**
 *  Sets the maximum number of nodes.
 */
- (void)setLength:(NSUInteger)length
{
    _length = length;
    
    // If our scene graph is not empty, reset it.
    if ([_graph isValid]) {
        
        [_graph purge];
        _graph = nil;
    }
    
    // Initialize graph data and initial settings.
    _graph = [[GRSceneGraph alloc] initWithIdentifier:@"Scene Graph" length:_length];
}
```

* You will also need to define a global default Graph length on top of your implementation file:

placing the following definition for new Node numbers (on top of the `@implementation` declarative):

``` Objective-C
/**
 *  Default scene graph length.
 */
#define kGRLengtDefault 10
```

* Next, update the Scene's `-didMoveToView:` method to match the following stub implementation (note that this method is responsible for initializing your Scene Graph):

``` Objective-C
#pragma mark -
#pragma mark Scene lifecycle

/**
 *  Any values set on nodes here will be used when the scene is rendered for the current frame.
 *
 *  @param view The view.
 */
- (void)didMoveToView:(SKView *)view
{
    /* Setup your scene here. */
    
    // Seed the random number generator.
    srandomdev();
    
    // Initialize graph data and initial settings.
    _graph = [[GRSceneGraph alloc] initWithIdentifier:@"Scene Graph" length:kGRLengtDefault];
    
    // Initialize the log.
    _log = [NSMutableString string];
    
    // Initialize the node number index.
    _idx = 0;
}
```

* Next, update the Scene's `-touchesBegan:withEvent:` method to match the following stub implementation (note that this method is responsible for adding both Nodes and Edges into your currently active Scene Graph):

``` Objective-C
/**
 *  Called when a touch begins.
 *
 *  @discussion Generally, all responders which do custom touch handling should override a number of methods.
 *  UIResponder will receive either -touchesEnded:withEvent: or -touchesCancelled:withEvent:
 *  for each touch it is handling (those touches it received in -touchesBegan:withEvent:).
 *
 *  @param touches A set of touches.
 *  @param event   An event.
 */
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches) {
        
        // Attempt to add a new node if, and only if, the graph isn't full. Otherwise, start allover.
        if ([_graph isFull] == NO) {
            
            // Allow conversion of UITouch coordinates to scene-space.
            CGPoint location = [touch locationInNode:self];
            
            // Add a new node to the graph and get its number (index).
            _idx = [_graph addNodeWithIdentifier:NSLocalizedString(@"Node", @"Node Identifier")
                                          weight:@(arc4random_uniform(100)) /* Random weight. */
                                        position:location
                                           color:nil
                                           scene:self];
            
            // Get a reference to the new node.
            GRNode *head = [_graph nodeAtIndex:_idx];
            
            // Add it as a child node of the scene (it must not have a parent).
            [self addChild:head];
            
            // Append log updates.
            [_log appendFormat:@"\n%@", [head description]];
            
            // New node is successfully added. Alert the view controller to play a sound file.
            if ([_sceneDelegate respondsToSelector:@selector(scene:addedNodeWithLog:)])
                [_sceneDelegate scene:self addedNodeWithLog:_log];
            
            // Edges require at least two nodes.
            if (_idx >= 1) {
                
                // Get a reference to the new node.
                GRNode *tail = [_graph nodeAtIndex:_idx - 1];
                
                // Calculate the Euclidean distance from the head to tail nodes.
                double euclideanDistance = [head calculateEuclideanDistanceFromNode:tail];
                
                [_graph addEdgeFromIndex:head.number
                                 toIndex:tail.number
                                  weight:@(euclideanDistance)
                                   scene:self];
                
                // Get a reference to the new node.
                GREdge *edge = [_graph edgeFromIndex:head.number toIndex:tail.number];
                
                // Add it as a child node of the scene (it must not have a parent).
                [self addChild:edge];
            }
            
        } else { // start allover.
            
            // Remove all the nodes and edges from this graph.
            [_graph purge];
            
            // Removes all the nodes and edges from the Grapher scene.
            [self removeAllChildren];
            
            // Re-initialize the node number index.
            _idx = 0;
            
            // Scene graph is purged successfully. Alert the view controller to play a sound file.
            if ([_sceneDelegate respondsToSelector:@selector(scene:purgedGraphWithLog:)])
                [_sceneDelegate scene:self purgedGraphWithLog:_log];
        }
    }
}
```

* You may also wish to leave the `-update:` method block empty, like so:

``` Objective-C
/**
 *  Called before each frame is rendered.
 *
 *  @param currentTime The current time interval.
 */
- (void)update:(CFTimeInterval)currentTime
{
    // NSLog(@"%s", __FUNCTION__);
}
```

> Awesome! Now you have a perfect good-looking Scene that responds to both user input, in addition to Graph creation and population. 

Time to update your View Controller class, too!

## Exercise 11: Modifying Your ViewController Class

Here, you will take you through a series of steps to initialize and setup your Scene...

### But What About Sound Effects..?

One thins to point out is that your main `GRViewController` class will do more than just control your Scene. In fact, we have expanded its capabilities to incorporate sound.. (yes you heard it folks: Sound!) into your app. Sound plays an important part in making your app experience (as a user) a more appealing and memorable experience.

> **Note:** Sound is simplified in your Grapher project via [AVFoundation](https://developer.apple.com/library/ios/documentation/AVFoundation/Reference/AVFoundationFramework/). See the [AVFoundation Reference](https://developer.apple.com/library/ios/documentation/AVFoundation/Reference/AVFoundationFramework/) for more information on how to utilize sound in your projects.

> **Note:** Although SpriteKit does have the ability to play sound effects, we made it deliberate to use other frameworks (for educational purpose i.e. by expanding your knowledge base by exploring additional iOS frameworks).

### Storytelling

Before you attempt to address the following tasks, let us tell you a little story that would ultimately make easier for you to fully grasp the idea behind the code...

Imagine a situation where you launch the app. You tap on anywhere within the screen boundaries, and you get the following result:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise10.0.1.png" width="100%" /></div>

Your first Node is rendered, and is also added to your currently active Scene (as part of the Scene Graph, and is numbered `0`).

Then after a few seconds you tap again somewhere else and you have another Node added, like so:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise10.0.2.png" width="100%" /></div>

The resulting Scene inserts two new Nodes: the previous "root" Node and this one (numbered `1`). Also, you immediately notice a new Edge is also inserted into the Scene Graph. This new Edge is also labelled (with the computed Euclidean distance between Node `#0` and Node `#1`). The label reflects that distance in a 2D Cartesian space.

Soon after a few more seconds, you tap on the screen once more and you end up having a third Node and an additional Edge, like so:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise10.0.3.png" width="100%" /></div>

For each tap/touch, a specific tone is played, indicating what sort of action was made...

Got it..? Brilliant! Now you can commence work on the `GRViewController` class, knowingly that you are fully aware of the app logic.

* Edit the `GRViewController.h` header and modify it to match the following code snippet. It contains a class interface declarations for defining the behavior of your ViewController class:

``` Objective-C
@import UIKit;
@import SpriteKit;
@import AVFoundation;

#import "GRScene.h"

/**
 *	Main view controller class.
 *	Used for rendering 2D nodes and edges.
 */
@interface GRViewController : UIViewController <GRSceneDelegate, AVAudioPlayerDelegate>

#pragma mark -
#pragma mark Utilities

/**
 *  Audio playback.
 */
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;

@end
```

* Your `GRViewController` implementation file is now ready for modification. Edit `GRViewController.m` and make sure you have the following three import statements on top of your file:

``` Objective-C
#import "GRSceneGraph.h"
#import "GRNode.h"
#import "GREdge.h"
```

* Now, add a global variable definition for audio playback errors (it is just a dummy error code):

``` Objective-C
/**
 *  Error code.
 */
#define kGRErrorCode 0
```

* Next, add audio support in your app by implementing two `AVAudioPlayerDelegate` protocol methods (`-audioPlayerDidFinishPlaying:successfully:` and `-audioPlayerDecodeErrorDidOccur:error:`) in no particular order:

``` Objective-C
#pragma mark -
#pragma mark AVAudioPlayerDelegate

/**
 *  For some reason, the audio player fails to load the associated audio file.
 *
 *  @param player An audio player.
 *  @param error  An error.
 */
- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error
{
    // Pass the error to the handler.
    [self handleError:error];
}

/**
 *  Called when a sound has finished playing.
 *  This method is NOT called if the player is stopped due to an interruption.
 *
 *  @param player An audio player.
 *  @param flag   A flag.
 */
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    _audioPlayer = nil;
}
```

* You will also need to implement the `-handleError:` method as follows:

placing the following definition for new Node numbers (on top of the `@implementation` declarative):

``` Objective-C
#pragma mark -
#pragma mark Error Handling

/**
 *  Error handler.
 *
 *  @param error An error.
 */
- (void)handleError:(NSError *)error
{
    // Inform of error in the application's main queue.
    dispatch_async(dispatch_get_main_queue(), ^{
        
        // No need to check to see if the audioPlayer is nil, since calling 'stop' will do nothing if it's nil.
        if (_audioPlayer.isPlaying)
            [_audioPlayer stop];
        _audioPlayer = nil;
        
        // Present the PhotoAlbum info in an AlertController instance.
        UIAlertController *alertController =
        [UIAlertController alertControllerWithTitle:NSLocalizedString(@"App Name", NULL)
                                            message:error.localizedDescription
                                     preferredStyle:UIAlertControllerStyleAlert];
        
        // Establish a "Dismiss" AlertAction object.
        UIAlertAction *dismissAction = [UIAlertAction actionWithTitle:@"Dismiss"
                                                                style:UIAlertActionStyleDefault
                                                              handler:NULL];
        
        // Add the AlertAction object to the AlertController object.
        [alertController addAction:dismissAction];
        
        // Present it.
        [self presentViewController:alertController animated:YES completion:nil];
    });
}
```

* Next, add a new method for handling audio playback:

``` Objective-C
#pragma mark -
#pragma mark Audio Playback

/**
 *  Setup audio playback, and play.
 *
 *  @param name      A filename.
 *  @param extension A file extension.
 *  @param sender    A sender.
 */
- (void)setupAudioPlaybackAndPlayResource:(nullable NSString *)name
                            withExtension:(nullable NSString *)extension
                                   sender:(nullable id)sender
{
    // Play sound in the application's main queue.
    dispatch_async(dispatch_get_main_queue(), ^{
        
        // Assign an audio sound (played when random point sets are generated and saved to file).
        NSError *error = nil;
        
        // No need to check to see if the audioPlayer is nil, since calling 'stop' will do nothing if it's nil.
        if (_audioPlayer.isPlaying)
            [_audioPlayer stop];
        _audioPlayer = nil;
        _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:
                        [[NSBundle mainBundle] URLForResource:name withExtension:extension]
                                                              error:&error];
        
        // If error, return.
        if (error) {
            
            [self handleError:error];
            return;
        }
        
        // All seems good.
        [_audioPlayer setDelegate:self];
        [_audioPlayer setVolume:1.0f];
        [_audioPlayer prepareToPlay];
        [_audioPlayer play];
    });
}
```

* Next, implement all methods of the `GRSceneDelegate` protocol:

``` Objective-C
#pragma mark -
#pragma mark GRSceneDelegate
/**
 *  Scene graph did add a new node to its graph.
 *
 *  @param  scene  A Grapher scene associated with this edge.
 *  @param log  A log.
 */
- (void)scene:(GRScene *)scene addedNodeWithLog:(NSMutableString *)log
{
    [self setupAudioPlaybackAndPlayResource:@"Pop" withExtension:@"wav" sender:nil];
}

/**
 *  Scene graph did purge its graph.
 *
 *  @param  scene  A Grapher scene associated with this edge.
 *  @param log  A log.
 */
- (void)scene:(GRScene *)scene purgedGraphWithLog:(NSMutableString *)log
{
    [self setupAudioPlaybackAndPlayResource:@"Rattle" withExtension:@"wav" sender:nil];
}
```

* You may also wish to leave the `-update:` method block empty, like so:

``` Objective-C
/**
 *  Called before each frame is rendered.
 *
 *  @param currentTime The current time interval.
 */
- (void)update:(CFTimeInterval)currentTime
{
    // NSLog(@"%s", __FUNCTION__);
}
```

* You're doing great! One last "relatively large" code segment to finish, and your implementation stages should be complete! Make sure your view lifecycle methods look like the following:

``` Objective-C
#pragma mark -
#pragma mark View lifecycle

/**
 *  Called after the view has been loaded,
 */
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Configure the view.
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    
    /* Sprite Kit applies additional optimizations to improve rendering performance */
    skView.ignoresSiblingOrder = YES;
    
    // Create and configure the scene.
    GRScene *scene = [GRScene nodeWithFileNamed:@"GRScene"];
    scene.sceneDelegate = self;
    scene.scaleMode = SKSceneScaleModeAspectFill;
    scene.backgroundColor = SKColor.darkGrayColor;
    
    // Present the scene.
    [skView presentScene:scene];
    
    // Setup audio playback and play the file.
    [self setupAudioPlaybackAndPlayResource:@"ComputerBeeps2" withExtension:@"wav" sender:nil];
}

/**
 *  Autorotation support.
 *
 *  @return The boolean value.
 */
- (BOOL)shouldAutorotate
{
    return YES;
}

/**
 *  Supported interface orientations.
 *
 *  @return The interface orientation mask value.
 */
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        
        return UIInterfaceOrientationMaskAllButUpsideDown;
        
    } else {
        
        return UIInterfaceOrientationMaskAll; // Current device (iPad).
    }
}

/**
 *  Called when the parent application receives a memory warning.
 */
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
    // Dispose of any resources that can be recreated.
    
    // Show the warning.
    [self handleError:[NSError errorWithDomain:NSCocoaErrorDomain
                                          code:kGRErrorCode
                                      userInfo:@{NSLocalizedDescriptionKey:@"Memory Warning!"}]];
}

/**
 *  Controls the attributes of the status bar when this view controller is shown.
 *  They can be overridden in view controller subclasses to return the desired status bar attributes.
 *  Default is NO.
 *
 *  @return The status bar flag.
 */
- (BOOL)prefersStatusBarHidden
{
    return YES;
}
```

> Splendid! You are now officially done with the hard parts of your Grapher project :)

**The remainder of the exercises are a broken down in twofold:**

* **Exercise 12** → Importing media assets into your project, and
* **Exercise 13** → Localizing your app (to display Arabic strings instead of default English terms).

Here, you will take you through a series of steps to initialize and setup your Scene...

## Exercise 12: Importing Media Assets

In this exercise, you will be instructed to import an Asset Catalog into your Xcode project workspace. Asset Catalogs are a good resource for hosting "literally" all of your images and icons.

After you [download and obtain](https://raw.github.com/youldash/iOS/master/Misc/Media.xcassets.zip) a copy of the accompanying `Media.xcassets` "Zip" archive:

* Unarchive the archive to access Assets Catalog folder (rename it to match the exact name if this step is necessary).

* Drag it into Xcode (preferably under the the "Grapher" group "yellow" icon).
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise12.0.1.png" width="100%" /></div>

The following dialog will appear if this step is successful (and make sure you mark "Copy items if needed"):
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise12.0.2.png" width="100%" /></div>

* If all goes well, confirm by editing `Media.xcassets` and inspect its contents. It should reveal an icon set that looks similar to the following:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise12.0.3.png" width="100%" /></div>

If you compile your project and test you app now, you should witness a new icon for your app.

**Next comes the part where you import a few selected sound files into you project...**

After you [download and obtain](https://raw.github.com/youldash/iOS/master/Misc/AudioArchive.zip) a copy of the accompanying sound files "Zip" archive:

* Unarchive the archive to access the WAV sample files.

* Drag them all into Xcode (preferably under the the "Grapher" group icon).
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise12.0.4.png" width="100%" /></div>

The same dialog from previous, will appear if this step is successful (again, make sure you mark "Copy items if needed").

* If all goes well, confirm by editing you project structure and identifying each file (by playing selected audio files if you will):
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise12.0.5.png" width="100%" /></div>

If you compile your project and test you app now, you should hear sound effects whenever you tap on the screen.

> **Note:** Xcode project files for this exercise will be pushed to this repo, later.

## Exercise 13: Localizing Your App

To add a bit of "Arabic flavor" into your app, you need to accomplish the following:

### Adding a new InfoPlist "Strings" File

* Add a new class by highlighting on the "Grapher" yellow icon and selecting "New File" from the File menu.

* Under the "iOS" section, select "Resource", and then choose "Strings File", like so:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise12.0.6.png" width="100%" /></div>

* When prompted for the filename, enter `InfoPlist.strings` as the specific filename (the filename **MUST BE EXACT!**), like so:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise12.0.7.png" width="100%" /></div>

* Enter the these two lines in `InfoPlist.strings` (both of which are needed so that Xcode can look them up and use them to rename your Grapher app to its equivalent naming in Arabic):

```
CFBundleDisplayName = "الرسام";
CFBundleName = "App Name – in Arabic";
```

* Confirm by clicking Create. Xcode will add and edit this new file for you.

Rebuild your project and witness the app's name change. It should reveal the Arabic string value by now.

### Adding a new Localization "Strings" File

* Add a new class by highlighting on the "Grapher" yellow icon and selecting "New File" from the File menu.

* Under the "iOS" section, select "Resource", and then choose "Strings File".

* When prompted for the filename, enter `Localizable.strings` as the specific filename (the filename **MUST BE EXACT!**), like so:
<div align="center"><img src="https://raw.github.com/youldash/iOS/master/Misc/Exercise12.0.8.png" width="100%" /></div>

* Enter the following lines in `Localizable.strings`. These of which are required for replacing any string calls from within your code (i.e. by invoking the `NSLocalizedString()` function) with their corresponding Arabic string phrases:

```
"Hello" = "مرحباً";
"Node" = "عقدة";
"Edge" = "حافة";
"Graph" = "رسم بياني";
"App Name" = "تطبيق الرسام";
```

* Confirm by clicking Create. Xcode will add and edit this new file for you.

Rebuild your project and witness the Node identifiers appear in Arabic. Cool, huh? :)

> **Note:** Xcode project files for this exercise will be pushed to this repo, later.

## Wrap-up

**Congratulations!** You have made it through our intensive training course :)

But... I have a confession to make! This is an enormous amount of information and should probably be a very lengthy handout. Nevertheless, I hope that you've enjoyed what was covered so far, and at least you've got a better understanding in making your ideas a living reality.

Thank you for sharing your interests!

**Your feedback would definitely count towards making such workshops a success!**

For any questions, or perhaps if you require further clarification (and if you have any specific topic you would like me to explain as a separate tutorial or workshop), please [**follow me on Twitter**](https://twitter.com/youldash) and I will (definitely) get back to as soon as I can!

Best wishes,

[**@youldash**](https://twitter.com/youldash)
