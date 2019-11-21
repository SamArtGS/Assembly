package input;

import java_cup.runtime.*;
%%

%public
%cup
%full
%char
%ignorecase
%eofval{
	return new Symbol(sym.EOF,new String("Fin del archivo"));
%eofval}

%%
"z80" { return new Symbol(sym.z80, new String (yytext())); }
[a-zA-Z0-9_]+"."("txt"|"asm"|"TXT"|"ASM") {return new Symbol(sym.file, new String (yytext())); }
"-"[ \t]*"H" { return new Symbol(sym.H, new String (yytext())); }
"-"[ \t]*"L" { return new Symbol(sym.L, new String (yytext())); }
[a-zA-Z0-9_]+ { return new Symbol(sym.nombre, new String (yytext())); }
".hex"|".lst" { }
[ \t]+ { }
. { System.err.println("Invalid input" + yytext()); }