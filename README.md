Layout+
=======

This library lets you create NSLayoutConstraints on iOS and OSX using an intuitive syntax.

You can write this:

```swift
addConstraint(label.layout.width == superview.layout.width / 2 + 20)
```

Instead of:

```swift
addConstraint(NSLayoutConstraint(item: label, attribute: .Width,
  relatedBy: .Equal, toItem: superview, attribute: .Width, multiplier: 0.5,
  constant: 20))
```

How to Use
----------

Use the `layout` property on your view to identiny the `NSLayoutAttribute` you'd like to constrain.

```swift
view.layout.height
view.layout.centerX
view.layout.trailing
// etc...
```

Use `==` `<=` and `>=` to define the `NSLayoutRelation` in the constraint.

```swift
label.layout.width == superview.layout.width
button.layout.height <= label.layout.height
view.layout.top >= label.layout.height
```

You can modify the constant in the constraint with addition or subtraction.

```swift
button.layout.top == label.layout.bottom + 40
button.layout.top - 40 == label.layout.bottom
```

These equations are reflexive, so the above two lines produce identical `NSLayoutConstraints`.

Multiplication and division similarly will set the multiplier in the constraint.

```swift
button.layout.width == label.layout.width * 2
button.layout.width / 2 == label.layout.width
```

Both of the above two lines will produce identical constraints.

Operate on all the things! YOLO

```swift
20 + 2 * button.layout.height - 40 <= 3 * label.layout.height / 2 + 40 - 20
```

It's handy to quickly define constraints inline with a call to `addConstraint`, but you can also easily capture them in a variable.

```swift
addConstraint(button.layout.leading == label.layout.trailing + 20)

let buttonLeadingConstraint = button.layout.leading == label.layout.trailing + 20
```

Installation
------------

Layout+ can be easily installed with [Carthage](https://github.com/Carthage/Carthage).

Add the origin to your [Cartfile](https://github.com/Carthage/Carthage/blob/master/Documentation/Artifacts.md#cartfile):

```
github "guenin/LayoutPlus"
```

Download & build the framework:

```
$ carthage update
```

Drag `LayoutPlus.framework` from the `Carthage/Build` folder into the “Embedded Binaries” section for your application target in XCode.

Add `import LayoutPlus` to any .swift file you want to use it in, and get started!

License
-------

Layout+ is released under the [MIT License](LICENSE).