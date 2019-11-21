package ensamblador;

import java_cup.runtime.*;

/*
Directivas:
public: clase publica
cup: compatibilidad con cup
full: extender el alfabeto con todos los valores de 8 bits
line: agrega la variable int yyline, para indicar la fila del lexema
char: agrega la variable int yychar, indica el indice del primer caracter del lexema
ignorecase: validar, indistitntamente si la letra es mayuscula o minuscula
eofval: especifica un valor de retorno al final del archivo
*/

%%


%cup
%full
%line
%column
%char
%ignorecase
%eofval{
	return new Symbol(sym.EOF,new String("Fin del archivo"));
%eofval}

%{
    private Symbol symbol(int type){
        parser.linea  += yytext();
        return new Symbol(type, yyline, yycolumn);
    }
    
    private Symbol symbol(int type, Object object){
        parser.linea  += yytext();
        return new Symbol(type, yyline, yycolumn, object);
    }
%}

%%
"ORG" {return symbol(sym.ORG, new String (yytext())); }
"00H" {return symbol(sym.PH, new String (yytext().substring(0, yytext().length() -1))); }
"08H" {return symbol(sym.PH, new String (yytext().substring(0, yytext().length() -1))); }
"10H" {return symbol(sym.PH, new String (yytext().substring(0, yytext().length() -1))); }
"18H" {return symbol(sym.PH, new String (yytext().substring(0, yytext().length() -1))); }
"20H" {return symbol(sym.PH, new String (yytext().substring(0, yytext().length() -1))); }
"28H" {return symbol(sym.PH, new String (yytext().substring(0, yytext().length() -1))); }
"30H" {return symbol(sym.PH, new String (yytext().substring(0, yytext().length() -1))); }
"38H" {return symbol(sym.PH, new String (yytext().substring(0, yytext().length() -1))); }
[0-9A-F]*[0-9A-F]*[0-9A-F]*[0-9A-F]"H" {return symbol(sym.NN, new String (yytext().substring(0, yytext().length() -1)));}
[0-7] {return symbol(sym.B, new String (yytext()));}
"(" {return symbol(sym.LPAR, new String (yytext()));}
")" {return symbol(sym.RPAR, new String (yytext()));}
"," {return symbol(sym.COMA, new String (yytext()));}
"+" {return symbol(sym.MAS, new String (yytext()));}
":" {return symbol(sym.DOS, new String (yytext()));}
"PUSH" {return symbol(sym.PUSH, new String (yytext()));}
"POP" {return symbol(sym.POP, new String (yytext()));}
"DAA" {return symbol(sym.DAA, new String (yytext()));}
"CPL" {return symbol(sym.CPL, new String (yytext()));}
"NEG" {return symbol(sym.NEG, new String (yytext()));}
"CCF" {return symbol(sym.CCF, new String (yytext()));}
"SCF" {return symbol(sym.SCF, new String (yytext()));}
"NOP" {return symbol(sym.NOP, new String (yytext()));}
"HALT" {return symbol(sym.HALT, new String (yytext()));}
"DI" {return symbol(sym.DI, new String (yytext()));}
"EI" {return symbol(sym.EI, new String (yytext()));}
"EX" {return symbol(sym.EI, new String (yytext()));}
"EXX" {return symbol(sym.EI, new String (yytext()));}
"FX" {return symbol(sym.EI, new String (yytext()));}
"LDI" {return symbol(sym.EI, new String (yytext()));}
"LDIR" {return symbol(sym.EI, new String (yytext()));}
"LDD" {return symbol(sym.EI, new String (yytext()));}
"LDDR" {return symbol(sym.EI, new String (yytext()));}
"CPI" {return symbol(sym.EI, new String (yytext()));}
"CPIR" {return symbol(sym.EI, new String (yytext()));}
"CPD" {return symbol(sym.EI, new String (yytext()));}
"CPDR" {return symbol(sym.EI, new String (yytext()));}
"IM"[ \t]*"0" {return symbol(sym.IM0, new String (yytext()));}
"IM"[ \t]*"1" {return symbol(sym.IM1, new String (yytext()));}
"IM"[ \t]*"2" {return symbol(sym.IM2, new String (yytext()));}
"CALL" {return symbol(sym.CALL, new String (yytext()));}
"RLCA" {return symbol(sym.RLCA, new String (yytext()));}
"RLA" {return symbol(sym.RLA, new String (yytext()));}
"RRCA" {return symbol(sym.RRCA, new String (yytext()));}
"RRA" {return symbol(sym.RRA, new String (yytext()));}
"RLC" {return symbol(sym.RLC, new String (yytext()));}
"RL" {return symbol(sym.RL, new String (yytext()));}
"RRC" {return symbol(sym.RRC, new String (yytext()));}
"RR" {return symbol(sym.RR, new String (yytext()));}
"SLA" {return symbol(sym.SLA, new String (yytext()));}
"SRA" {return symbol(sym.SRA, new String (yytext()));}
"SRL" {return symbol(sym.SRL, new String (yytext()));}
"RLD" {return symbol(sym.RLD, new String (yytext()));}
"RRD" {return symbol(sym.RRD, new String (yytext()));}
"RET" {return symbol(sym.RET, new String (yytext()));}
"RETI" {return symbol(sym.RETI, new String (yytext()));}
"RETN" {return symbol(sym.RETN, new String (yytext()));}
"RST"  {return symbol(sym.RST, new String (yytext()));}
"BIT" {return symbol(sym.BIT, new String (yytext()));}
"SET" {return symbol(sym.SET, new String (yytext()));}
"RES" {return symbol(sym.RES, new String (yytext()));}
"ADD" {return symbol(sym.ADD, new String (yytext()));}
"ADC" {return symbol(sym.ADC, new String (yytext()));}
"SUB" {return symbol(sym.SUB, new String (yytext()));}
"SBC" {return symbol(sym.SBC, new String (yytext()));}
"AND" {return symbol(sym.AND, new String (yytext()));}
"OR" {return symbol(sym.OR, new String (yytext()));}
"XOR" {return symbol(sym.XOR, new String (yytext()));}
"CP" {return symbol(sym.CP, new String (yytext()));}
"INC" {return symbol(sym.INC, new String (yytext()));}
"DEC" {return symbol(sym.DEC, new String (yytext()));}
"DJ" {return symbol(sym.DJ, new String (yytext()));}
"JR" {return symbol(sym.JR, new String (yytext()));}
"JP" {return symbol(sym.JP, new String (yytext()));}
"LD" {return symbol(sym.LD, new String (yytext()));}
"HL" {return symbol(sym.HL, new String (yytext()));}
"IX" {return symbol(sym.IX, new String (yytext()));}
"IY" {return symbol(sym.IY, new String (yytext()));}
"BC" {return symbol(sym.BC, new String (yytext()));}
"DE" {return symbol(sym.DE, new String (yytext()));}
"AF" {return symbol(sym.AF, new String (yytext()));}
"SP" {return symbol(sym.SP, new String (yytext()));}
"IN" {return symbol(sym.IN, new String (yytext()));}
"INI" {return symbol(sym.INI, new String (yytext()));}
"INIR" {return symbol(sym.INIR, new String (yytext()));}
"IND" {return symbol(sym.IND, new String (yytext()));}
"INDR" {return symbol(sym.INDR, new String (yytext()));}
"OUT" {return symbol(sym.OUT, new String (yytext()));}
"OUTI" {return symbol(sym.OUTI, new String (yytext()));}
"OTIR" {return symbol(sym.OTIR, new String (yytext()));}
"OUTD" {return symbol(sym.OUTD, new String (yytext()));}
"OTDR" {return symbol(sym.OTDR, new String (yytext()));}
"I" {return symbol(sym.I, new String (yytext()));}
"R" {return symbol(sym.R, new String (yytext()));}
"A" {return symbol(sym.A, new String (yytext()));}
"B" {return symbol(sym.REG, new String (yytext()));}
"D" {return symbol(sym.REG, new String (yytext()));}
"E" {return symbol(sym.REG, new String (yytext()));}
"H" {return symbol(sym.REG, new String (yytext()));}
"L" {return symbol(sym.REG, new String (yytext()));}
"NZ" {return symbol(sym.NZ, new String (yytext()));}
"Z" {return symbol(sym.Z, new String (yytext()));}
"NC" {return symbol(sym.NC, new String (yytext()));}
"C" {return symbol(sym.C, new String (yytext()));}
"PO" {return symbol(sym.PO, new String (yytext()));}
"PE" {return symbol(sym.PE, new String (yytext()));}
"P" {return  symbol(sym.P, new String (yytext()));}
"M" {return  symbol(sym.M, new String (yytext()));}
";"[^\n]* {parser.linea  += yytext().substring(0, yytext().length() -1); return new Symbol(sym.COM, yyline, yycolumn, new String (yytext()));}
[0-9A-F]?[0-9A-F] {return symbol(sym.N, new String (yytext()));}
[A-Za-z_0-9]+ {return symbol(sym.ETI, new String (yytext()));}
[\n\r]+ {return new Symbol(sym.SL, new String (yytext()));}
[\t ]+ {parser.linea  += yytext();}
. { System.err.println("Lexical Error <" + yytext() + "> line: " + (yyline + 1) + ", column: " + (yycolumn + 1));}