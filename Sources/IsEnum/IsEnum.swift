/// A utility macro that can be attached to an enum and expands to `isCase`.
///
/// ## Example
///
/// ```swift
/// @AddIsEnum
/// enum Direction {
///    case north
///    case south
///    case east, west
/// }
/// ```
/// Will expands to:
/// ```swift
/// enum Direction {
///     case north
///     case south
///     case east, west
///     var isNorth: Bool {
///         self == .north
///     }
///
///     var isSouth: Bool {
///         self == .south
///     }
///
///     var isEast: Bool {
///         self == .east
///     }
///
///     var isWest: Bool {
///         self == .west
///     }
/// }
/// ```
@attached(member, names: arbitrary)
public macro AddIsEnum() = #externalMacro(module: "IsEnumMacros", type: "AddIsEnumMacro")
