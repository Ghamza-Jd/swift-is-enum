import IsEnum

@AddIsEnum
enum Direction {
    case north
    case south
    case east, west
}

let direction: Direction = .north

print(direction.isNorth)
