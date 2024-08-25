# IsEnum

A utility macro that can be attached to an enum to generate boolean matches for a more readable code.

## Example

```swift
@AddIsEnum
enum Direction {
   case north
   case south
   case east, west
}
```

Will expands to:

```swift
enum Direction {
    case north
    case south
    case east, west
    var isNorth: Bool {
        self == .north
    }
    var isSouth: Bool {
        self == .south
    }
    var isEast: Bool {
        self == .east
    }
    var isWest: Bool {
        self == .west
    }
}

let direction: Direction = .north

print(direction.isNorth)
```

## Plans

At first I just wanted it to be as simple as the current implementation is, but along the way I though of a new features:

- extention over `Optional` type so we can have a `.isNone`, `.isSome`, `.isEnumVariant`
- extention over `Result`, same as `Optional`
- Generate boolean per variant
- Ignore specific variants
