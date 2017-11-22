# CircleFill
Animation which circularly fills a UIView starting from a given point<br/>

<img src="https://i.imgur.com/nRVHDj8.gif" width=200/>

## Installation
For now, all the code is in one file, `CircleFill.swift`. You can just copy this file in your project to make it work

## Usage
CircleFill is a UIView extension. It works (supposedly) on all kind of UIView.
Here's how to use it

### Fill the view
```
// Choose one of the following prototype:
view.fillBackgroundFrom(point: aSubView.center, with: UIColor.green)
view.fillBackgroundFrom(point: anotherView.frame.origin, with: UIColor.blue, in: 2.0)
```

### Empty the view
```
// Choose one of the following prototype:
view.emptyBackgroundTo(point: view.center)
view.emptyBackgroundTo(point: view.center, in: 0.5)
```

## Parameters
`point : CGPoint` -> The point of the view where the animation begins / ends.<br />
`with color: UIColor` -> The color used to fill the view. Only available for `fillBackgroundFrom`.<br />
`in time: CFTimeInterval` -> The duration of the animation. Default is `1.0`.<br />
