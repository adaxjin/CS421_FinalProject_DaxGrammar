grammar DAXGrammar;

//==========================================================
// Parser Rules
//==========================================================

startRule : functionCategory EOF;

// Reference: https://learn.microsoft.com/en-us/dax/dax-function-reference
functionCategory: 
      aggregationFunctions
    | informationFunctions
    ;

aggregationFunctions:
      approximateDistinctionCountFunction
    | averageFunction
    | averageaFunction
    | averagexFunction
    | countFunction
    | countaFunction
    | countaxFunction
    | countBlankFunction
    | countRowsFunction
    | countxFunction
    | distinctCountFunction
    | distinctCountNoBlankFunction
    | maxFunction
    | maxaFunction
    | maxxFunction
    | minFunction
    | minaFunction
    | minxFunction
    | productFunction
    | productxFunction
    | sumFunction
    | sumxFunction
    ;

informationFunctions:
      columnStatisticsFunction
    | containsFunction
    | containsRowFunction
    | containsStringFunction
    | containsStringExactFunction
    | customDataFunction
    | hasOneFilterFunction
    | hasOneValueFunction
    | isAfterFunction
    | isBlankFunction
    | isCrossFilteredFunction
    | isEmptyFunction
    | isErrorFunction
    | isEvenFunction
    | isFilteredFunction
    | isInScopeFunction
    | isLogicalFunction
    | isNonTextFunction
    | isNumberFunction
    | isOddFunction
    | isOnOrAfterFunction
    | isSelectedMeasureFunction
    | isSubtotalFunction
    | isTextFunction
    | nonVisualFunction
    | selectedMeasureFunction
    | selectedMeasureFormatStringFunction
    | selectedMeasureNameFunction
    | userCultureFunction
    | userNameFunction
    | userObjectIDFunction
    | userPrincipalNameFunction
    ;

// Parser rules for aggregationFunctions
// Reference: https://learn.microsoft.com/en-us/dax/aggregation-functions-dax
approximateDistinctionCountFunction : 
    APPROXIMATEDISTINCTCOUNT_SYMBOL OPAREN anyColRef CPAREN;

averageFunction : 
    AVERAGE_SYMBOL OPAREN anyColRef CPAREN;

averageaFunction : 
    AVERAGEA_SYMBOL OPAREN anyColRef CPAREN;

averagexFunction :
    AVERAGEX_SYMBOL OPAREN tableExpr LIST_SEPARATOR exprOverTable CPAREN;

countFunction :
    COUNT_SYMBOL OPAREN anyColRef CPAREN;

countaFunction : 
    COUNTA_SYMBOL OPAREN anyColRef CPAREN;

countaxFunction : 
    COUNTAX_SYMBOL OPAREN tableExpr LIST_SEPARATOR exprOverTable CPAREN;

countBlankFunction : 
    COUNTBLANK_SYMBOL OPAREN anyColRef CPAREN;

countRowsFunction :
    COUNTROWS_SYMBOL OPAREN tableExpr? CPAREN;

countxFunction : 
    COUNTX_SYMBOL OPAREN tableExpr LIST_SEPARATOR exprOverTable CPAREN;

distinctCountFunction :
    DISTINCTCOUNT_SYMBOL OPAREN anyColRef CPAREN;

distinctCountNoBlankFunction :
    DISTINCTCOUNTNOBLANK_SYMBOL OPAREN anyColRef CPAREN;

maxFunction :
    MAX_SYMBOL OPAREN (anyColRef | typeScalar) CPAREN;

maxaFunction :
    MAXA_SYMBOL OPAREN anyColRef CPAREN;

maxxFunction :
    MAXX_SYMBOL OPAREN tableExpr LIST_SEPARATOR exprOverTable (LIST_SEPARATOR variant)? CPAREN;

minFunction : 
    MIN_SYMBOL OPAREN (anyColRef | typeScalar) CPAREN;

minaFunction :
    MINA_SYMBOL OPAREN anyColRef CPAREN;

minxFunction :
    MINX_SYMBOL OPAREN tableExpr LIST_SEPARATOR exprOverTable (LIST_SEPARATOR variant)? CPAREN;

productFunction :
    PRODUCT_SYMBOL OPAREN anyColRef CPAREN;

productxFunction :
    PRODUCTX_SYMBOL OPAREN tableExpr LIST_SEPARATOR exprOverTable CPAREN;

sumFunction :
    SUM_SYMBOL OPAREN anyColRef CPAREN;

sumxFunction :
    SUMX_SYMBOL OPAREN tableExpr LIST_SEPARATOR exprOverTable CPAREN;

// Parser rules for informationFunctions
// Reference: https://learn.microsoft.com/en-us/dax/information-functions-dax
columnStatisticsFunction :
    COLUMNSTATISTICS_SYMBOL OPAREN CPAREN;

containsFunction :
    CONTAINS_SYMBOL OPAREN tableExpr (LIST_SEPARATOR anyColRef LIST_SEPARATOR scalarValue)+ CPAREN;

containsRowFunction :
    CONTAINSROW_SYMBOL OPAREN tableExpr (LIST_SEPARATOR scalarValue)+ CPAREN;

containsStringFunction :
    CONTAINSSTRING_SYMBOL OPAREN withinText LIST_SEPARATOR findText CPAREN;

containsStringExactFunction :
    CONTAINSSTRINGEXACT_SYMBOL OPAREN withinText LIST_SEPARATOR findText CPAREN;

customDataFunction :
    CUSTOMDATA_SYMBOL OPAREN CPAREN;

hasOneFilterFunction :
    HASONEFILTER_SYMBOL OPAREN anyColRef CPAREN;

hasOneValueFunction :
    HASONEVALUE_SYMBOL OPAREN qualifiedColRef CPAREN;

isAfterFunction :
    ISAFTER_SYMBOL OPAREN 
        scalarValue LIST_SEPARATOR scalarValue (LIST_SEPARATOR sortOrder)?
        (LIST_SEPARATOR scalarValue LIST_SEPARATOR scalarValue (LIST_SEPARATOR sortOrder)?)*
    CPAREN;

isBlankFunction :
    ISBLANK_SYMBOL OPAREN value CPAREN;

isCrossFilteredFunction :
    ISCROSSFILTERED_SYMBOL OPAREN (tableRef | anyColRef) CPAREN;

isEmptyFunction :
    ISEMPTY_SYMBOL OPAREN tableExpr CPAREN;

isErrorFunction :
    ISERROR_SYMBOL OPAREN value CPAREN;

isEvenFunction :
    ISEVEN_SYMBOL OPAREN value CPAREN;

isFilteredFunction :
    ISFILTERED_SYMBOL OPAREN (tableRef | anyColRef) CPAREN;

isInScopeFunction :
    ISINSCOPE_SYMBOL OPAREN anyColRef CPAREN;

isLogicalFunction :
    ISLOGICAL_SYMBOL OPAREN value CPAREN;

isNonTextFunction :
    ISNONTEXT_SYMBOL OPAREN value CPAREN;

isNumberFunction :
    ISNUMBER_SYMBOL OPAREN value CPAREN;

isOddFunction :
    ISODD_SYMBOL OPAREN value CPAREN;

isOnOrAfterFunction :
    ISONORAFTER_SYMBOL OPAREN 
        scalarValue LIST_SEPARATOR scalarValue (LIST_SEPARATOR sortOrder)?
        (LIST_SEPARATOR scalarValue LIST_SEPARATOR scalarValue (LIST_SEPARATOR sortOrder)?)*
    CPAREN;

isSelectedMeasureFunction :
    ISSELECTEDMEASURE_SYMBOL OPAREN measureRef (LIST_SEPARATOR measureRef)* CPAREN;

isSubtotalFunction :
    ISSUBTOTAL_SYMBOL OPAREN anyColRef CPAREN;

isTextFunction :
    ISTEXT_SYMBOL OPAREN value CPAREN;

nonVisualFunction :
    NONVISUAL_SYMBOL OPAREN tableExpr CPAREN;

selectedMeasureFunction :
    SELECTEDMEASURE_SYMBOL OPAREN CPAREN;

selectedMeasureFormatStringFunction :
    SELECTEDMEASUREFORMATSTRING_SYMBOL OPAREN CPAREN;

selectedMeasureNameFunction :
    SELECTEDMEASURENAME_SYMBOL OPAREN CPAREN;

userCultureFunction :
    USERCULTURE_SYMBOL OPAREN CPAREN;

userNameFunction :  
    USERNAME_SYMBOL OPAREN CPAREN;

userObjectIDFunction :
    USEROBJECTID_SYMBOL OPAREN CPAREN;

userPrincipalNameFunction :
    USERPRINCIPALNAME_SYMBOL OPAREN CPAREN;

// ParamsRoles
// TODO: tokens to be define
anyColRef :                             simpleColRef | qualifiedColRef;
simpleColRef :                          IDENTIFIER;
qualifiedColRef :                       IDENTIFIER;
tableRef :                              IDENTIFIER;
tableExpr :                             IDENTIFIER;
exprOverTable :                         IDENTIFIER;
measureRef :                            IDENTIFIER;

variant :                               BOOLEAN;                // enumValue : TypeEnumValue
sortOrder :                             ORDERING;
scalarValue :                           IDENTIFIER | NUMBER;    // scalar value or expression that returns a scalar value
value :                                 IDENTIFIER | NUMBER;
typeScalar :                            IDENTIFIER;
withinText :                            STRING;
findText :                              STRING;



//==========================================================
// Lexer Rules
//==========================================================

// OPERATORS
// Arithmetic Operators
PLUS :                                  '+';
MINUS :                                 '-';
TIMES :                                 '*';
DIVIDE :                                '/';
POWER :                                 '^';

// Comparison Operators
ARE_EQUAL:                              '==';
GREATER_THAN_EQUALS :                   '>=';
LESS_THAN_EQUALS :                      '<=';
NOT_EQUAL :                             '<>';  
EQUALS :                                '=';
GREATER_THAN :                          '>';
LESS_THAN :                             '<';

// Text Concatenation Operator
CONCATENATE :                           '&';

// Logical Operators
LOGICAL_AND :                           '&&';
LOGICAL_OR:                             '||';
LOGICAL_IN:                             'IN';

// Parentheses
OPAREN :                                '(';
CPAREN :                                ')';
OCURLY :                                '{';
CCURLY :                                '}';

LIST_SEPARATOR :                        ',';

// Enums
BOOLEAN :                               TRUE | FALSE;
ORDERING :                              ASC | DEC;

// Letters
fragment A: [aA];
fragment B: [bB];
fragment C: [cC];
fragment D: [dD];
fragment E: [eE];
fragment F: [fF];
fragment G: [gG];
fragment H: [hH];
fragment I: [iI];
fragment J: [jJ];
fragment K: [kK];
fragment L: [lL];
fragment M: [mM];
fragment N: [nN];
fragment O: [oO];
fragment P: [pP];
fragment Q: [qQ];
fragment R: [rR];
fragment S: [sS];
fragment T: [tT];
fragment U: [uU];
fragment V: [vV];
fragment W: [wW];
fragment X: [xX];
fragment Y: [yY];
fragment Z: [zZ];

// FUNCTION_CATEGORY
// Symbols for aggregationFunctions
APPROXIMATEDISTINCTCOUNT_SYMBOL :       A P P R O X I M A T E D I S T I N C T C O U N T;
AVERAGE_SYMBOL :                        A V E R A G E;
AVERAGEA_SYMBOL :                       A V E R A G E A;
AVERAGEX_SYMBOL :                       A V E R A G E X;
COUNT_SYMBOL :                          C O U N T;
COUNTA_SYMBOL :                         C O U N T A;
COUNTAX_SYMBOL :                        C O U N T A X;
COUNTBLANK_SYMBOL :                     C O U N T B L A N K;
COUNTROWS_SYMBOL :                      C O U N T R O W S;
COUNTX_SYMBOL :                         C O U N T X;
DISTINCTCOUNT_SYMBOL :                  D I S T I N C T C O U N T;
DISTINCTCOUNTNOBLANK_SYMBOL :           D I S T I N C T C O U N T N O B L A N K;
MAX_SYMBOL :                            M A X;
MAXA_SYMBOL :                           M A X A;
MAXX_SYMBOL :                           M A X X;
MIN_SYMBOL :                            M I N;
MINA_SYMBOL :                           M I N A;
MINX_SYMBOL :                           M I N X;
PRODUCT_SYMBOL :                        P R O D U C T;
PRODUCTX_SYMBOL :                       P R O D U C T X;
SUM_SYMBOL :                            S U M;
SUMX_SYMBOL :                           S U M X;

// Symbols for informationFunctions
COLUMNSTATISTICS_SYMBOL :               C O L U M N S T A T I S T I C S;
CONTAINS_SYMBOL :                       C O N T A I N S;
CONTAINSROW_SYMBOL :                    C O N T A I N S R O W;
CONTAINSSTRING_SYMBOL :                 C O N T A I N S S T R I N G;
CONTAINSSTRINGEXACT_SYMBOL :            C O N T A I N S S T R I N G E X A C T;
CUSTOMDATA_SYMBOL :                     C U S T O M D A T A;
HASONEFILTER_SYMBOL :                   H A S O N E F I L T E R;
HASONEVALUE_SYMBOL :                    H A S O N E V A L U E;
ISAFTER_SYMBOL :                        I S A F T E R;
ISBLANK_SYMBOL :                        I S B L A N K;
ISCROSSFILTERED_SYMBOL :                I S C R O S S F I L T E R E D;
ISEMPTY_SYMBOL :                        I S E M P T Y;
ISERROR_SYMBOL :                        I S E R R O R;
ISEVEN_SYMBOL :                         I S E V E N;
ISFILTERED_SYMBOL :                     I S F I L T E R E D;
ISINSCOPE_SYMBOL :                      I S I N S C O P E;
ISLOGICAL_SYMBOL :                      I S L O G I C A L;
ISNONTEXT_SYMBOL :                      I S N O N T E X T;
ISNUMBER_SYMBOL :                       I S N U M B E R;
ISODD_SYMBOL :                          I S O D D;
ISONORAFTER_SYMBOL :                    I S O N O R A F T E R;
ISSELECTEDMEASURE_SYMBOL :              I S S E L E C T E D M E A S U R E;
ISSUBTOTAL_SYMBOL :                     I S S U B T O T A L;
ISTEXT_SYMBOL :                         I S T E X T;
NONVISUAL_SYMBOL :                      N O N V I S U A L;
SELECTEDMEASURE_SYMBOL :                S E L E C T E D M E A S U R E;
SELECTEDMEASUREFORMATSTRING_SYMBOL :    S E L E C T E D M E A S U R E F O R M A T S T R I N G;
SELECTEDMEASURENAME_SYMBOL :            S E L E C T E D M E A S U R E N A M E;
USERCULTURE_SYMBOL :                    U S E R C U L T U R E;
USERNAME_SYMBOL :                       U S E R N A M E;
USEROBJECTID_SYMBOL :                   U S E R O B J E C T I D;
USERPRINCIPALNAME_SYMBOL :              U S E R P R I N C I P A L N A M E;

// Utilities
WHITESPACE :                            [ \t\r\n]+ -> skip;
STRING :                                '"' ( ~'"' | '""' )* '"' ;
NUMBER :                                (([0-9]+.[0-9]*)|([0-9]*.[0-9]+)|([0-9]+))([eE][+\-]?[0-9]+)?;
DATETIME :                              '#' ( ~'#' | '##' )* '#';
DOT :                                   '.';
CURRENCY :                              '$' NUMBER; // TODO: culture
IDENTIFIER :                            [a-zA-Z_][a-zA-Z_0-9.]*;

// Enum Definitions
TRUE :                                  T R U E;
FALSE :                                 F A L S E;

ASC :                                   A S C;
DEC :                                   D E C;

// Datatypes
DATA_TYPES : 
      NUMBER
    | STRING
    | BOOLEAN
    | DATETIME
    | CURRENCY
    ;