## Prototype: Create Reusable DAX Parsers using ANTLR 4
### CS421 Final Project - Summer 2023 - Xue Jin

The goal of this project is to prototype and potentially create reusable DAX parsers in C# and Typescript from a single (set of) grammar file(s). This approach would extract the DAX grammar code from the functional code and enable language-agnostic parser generation to a certain extent. ANTLR 4 is a promising tool to accomplish this objective, as it can generate a parser to construct a parse tree and provide a listener/visitor interface to respond to phase recognition if provided with a given set of grammars, with support for 10 target languages including C# and Typescript [^1]. It could also spin into a good open-source project for DAX parser users.

**AntlrCSharp/DAXGrammar.g4 contains the DAX parser and lexer rules.**

**AntlrCSharpTests/DAXGrammarTests.cs contains the unit tests.**

[^1]: https://github.com/antlr/antlr4/blob/dev/README.md
