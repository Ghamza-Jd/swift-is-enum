import SwiftCompilerPlugin
import SwiftDiagnostics
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct AddIsEnumMacro: MemberMacro {
    public static func expansion(
        of node: AttributeSyntax,
        providingMembersOf declaration: some DeclGroupSyntax,
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        // Ensure the declaration is an enum
        guard let enumDecl = declaration.as(EnumDeclSyntax.self) else {
            return []
        }

        let isCases: [DeclSyntax] = enumDecl
            .memberBlock
            .members
            .compactMap { $0.decl.as(EnumCaseDeclSyntax.self) }
            .map { $0.elements.compactMap { $0.name.text } }
            .reduce([], +)
            .map { .init(stringLiteral: "var is\($0.capitalized): Bool { self == .\($0) }") }

        return isCases
    }
}

@main
struct IsEnumPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        AddIsEnumMacro.self
    ]
}
