import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest

#if canImport(IsEnumMacros)
import IsEnumMacros

let testMacros: [String: Macro.Type] = [:]
#endif

final class IsEnumTests: XCTestCase { }
