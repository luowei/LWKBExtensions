# Graph Report - /Users/luowei/projects/libs/LWKBExtensions  (2026-05-04)

## Corpus Check
- Corpus is ~5,894 words - fits in a single context window. You may not need a graph.

## Summary
- 69 nodes · 55 edges · 9 communities detected
- Extraction: 98% EXTRACTED · 2% INFERRED · 0% AMBIGUOUS · INFERRED: 1 edges (avg confidence: 0.8)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- [[_COMMUNITY_Community 0|Community 0]]
- [[_COMMUNITY_Community 1|Community 1]]
- [[_COMMUNITY_Community 2|Community 2]]
- [[_COMMUNITY_Community 3|Community 3]]
- [[_COMMUNITY_Community 4|Community 4]]
- [[_COMMUNITY_Community 5|Community 5]]
- [[_COMMUNITY_Community 6|Community 6]]
- [[_COMMUNITY_Community 7|Community 7]]
- [[_COMMUNITY_Community 8|Community 8]]

## God Nodes (most connected - your core abstractions)
1. `UIImageView` - 9 edges
2. `String` - 8 edges
3. `LWAppDelegate` - 7 edges
4. `UIImageView` - 7 edges
5. `NSString` - 7 edges
6. `Tests` - 4 edges
7. `LWViewController` - 3 edges
8. `UIImageView` - 3 edges
9. `NSArray` - 2 edges
10. `Array` - 2 edges

## Surprising Connections (you probably didn't know these)
- None detected - all connections are within the same source files.

## Communities (16 total, 3 thin omitted)

### Community 2 - "Community 2"
Cohesion: 0.22
Nodes (8): UIImage, UIImageView, -pauseAnimations, -pauseLayer, -resumeAnimations, -resumeLayer, -rotate360WithDurationrepeatCount, -stopAllAnimations

### Community 3 - "Community 3"
Cohesion: 0.25
Nodes (7): LWAppDelegate, -applicationDidBecomeActive, -applicationDidEnterBackground, -applicationdidFinishLaunchingWithOptions, -applicationWillEnterForeground, -applicationWillResignActive, -applicationWillTerminate

### Community 4 - "Community 4"
Cohesion: 0.25
Nodes (7): NSString, -enumerateCharactersUsingBlock, -heigthWithWidthandFont, -image, -URLDecode, -URLEncode, -widthWithFont

### Community 5 - "Community 5"
Cohesion: 0.4
Nodes (4): Tests, -setUp, -tearDown, -testExample

### Community 6 - "Community 6"
Cohesion: 0.5
Nodes (3): LWViewController, -didReceiveMemoryWarning, -viewDidLoad

### Community 7 - "Community 7"
Cohesion: 0.5
Nodes (3): UIImageView, -layoutSublayersOfLayer, -setBordercolor

## Knowledge Gaps
- **27 isolated node(s):** `-setUp`, `-tearDown`, `-testExample`, `-applicationdidFinishLaunchingWithOptions`, `-applicationWillResignActive` (+22 more)
  These have ≤1 connection - possible missing edges or undocumented components.
- **3 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **What connects `-setUp`, `-tearDown`, `-testExample` to the rest of the system?**
  _27 weakly-connected nodes found - possible documentation gaps or missing edges._