	ORG 400H
	LD A, (1040H)
	CALL FIB
	HALT
FIB:CP 14
	JP P, eti2
	PUSH AF
	CALL FIBO
	POP AF
	POP AF
	LD (1041H), A
	RET
FIBO:CP 1
	JR Z, eti1
	CP 0
	JR Z, eti1
	DEC A
	PUSH AF
	CALL FIBO
	POP AF
	DEC A
	CALL FIBO
	POP AF
	POP BC
	ADD A, B
	POP DE
	POP BC
	PUSH AF
	PUSH BC
	PUSH DE
	RET
eti1: POP DE
	POP BC
	PUSH AF
	PUSH BC
	PUSH DE 
	RET
eti2:	LD A, 1
	LD (1041H), A
	RET