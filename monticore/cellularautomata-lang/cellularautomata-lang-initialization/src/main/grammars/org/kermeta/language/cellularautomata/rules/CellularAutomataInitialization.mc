package org.kermeta.language.cellularautomata.rules;

version "0.0.1";

grammar CellularAutomataInitialization extends mc.literals.Literals {

  /* ======================================================================= */
  /* =============================== GRAMMAR =============================== */
  /* ======================================================================= */

  CAInit =
    (geometry:RegularGeometry)?
    seedRules:Rule (seedRules:Rule)*
  ;


  Rule =
    "where" (filter:GlobalPosition) "initValue" "=" "{" evaluatedVal:Conditional "}"
  ;

  GlobalPosition =
	"{" coordinateRanges:CoordinateRange ("x" (coordinateRanges:CoordinateRange)?)* "}"
  ;

  CoordinateRange =
	"[" (lowerCoordinate:IntLiteral) "," (upperCoordinate:IntLiteral) "]"
  ;

  PositionLiteral =
    "positionOn" "[" dimensionIndex:IntLiteral "]"
  ;

  RegularGeometry =
	"regularGeometry" neighborsNumber:IntLiteral "{" dimensions:Dimension  ("x" dimensions:Dimension)* "}"
  ;

  Dimension =
	(size:IntLiteral) | ["isCircular"] "(" size:IntLiteral ")"
  ;

  Conditional =
    OrExpression
    |
    ("if" condition:Conditional "{" trueExpr:Conditional "}" "else" "{" falseExpr:Conditional "}")
  ;

  OrExpression =
    left:AndExpression ("|" right:AndExpression)*;

  AndExpression =
    left:EqualExpression ("&" right:EqualExpression)*;

  EqualExpression =
    left:ComparisonExpression ("==" right:ComparisonExpression)*;

  ComparisonExpression =
    left:AddExpression ((lower:["<"] | greater:[">"]) right:AddExpression)*;

  AddExpression =
    left:MultExpression ((plus:["+"] | minus:["-"]) right:MultExpression)*;

  MultExpression =
    left:UnaryExpression ((mult:["*"] | div:["/"] | mod:["%"]) right:UnaryExpression)*;

  UnaryExpression =
    (not:["!"] | uminus:["-"])? LiteralsExpression;

  LiteralsExpression = "(" Conditional ")" | IntLiteral | PositionLiteral; // TODO SignedIntLiteral



}