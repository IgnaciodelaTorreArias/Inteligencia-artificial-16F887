				LIST P=16F887			; Declara micro utilizado
				INCLUDE "P16F887.INC"	; Carga libreria del micro
				__CONFIG		2007, 24F4
				ERROR_FIG_1		EQU 0x20
				ERROR_FIG_2		EQU 0x21
				ERROR_FIG_3		EQU 0x22
				ERROR_FIG_4		EQU 0x23
				R0				EQU 0x24
				R1				EQU 0x25
				
				LINE_SEL		EQU 0x70
				LINE			EQU 0x71
				L_PATT			EQU 0x72
				L_COMB			EQU 0x73
				L_SUB			EQU 0x74
				ERROR_L			EQU 0x75
				CONTADOR		EQU 0x76
				
				ORG 0X00		; Direccion donde inicia el programa
				GOTO INICIO

INICIO
	BSF 	STATUS,RP0			; Mover a banco 3
	BSF 	STATUS,RP1
	CLRF 	ANSEL				; Configurar puertos como digitales
	CLRF 	ANSELH
	CLRF 	TRISB				; Configurar puerto B como salida
	BCF 	STATUS,RP1
	CLRF 	TRISC				; Configurar puerto C como salida
	BCF 	STATUS,RP0			; Regresar a banco 0

	
	; Prepare Data
	BSF 	STATUS,RP0			; Mover a banco 1
	CALL 	PREPARE_DATA_FIG_1
	CALL 	PREPARE_DATA_FIG_2

	BCF		STATUS,RP0			; Mover a banco 2
	BSF 	STATUS,RP1
	CALL	PREPARE_DATA_FIG_3
	CALL	PREPARE_DATA_FIG_4
	BCF 	STATUS,RP1			; Mover a banco 0
	CALL	STORE_PATERNS
	
	GOTO	LOOP

STORE_PATERNS
	; FIG 1
	MOVLW	b'11111111'	; L0
	MOVWF	0x28
	MOVLW	b'01111111'	; L1
	MOVWF	0x29
	MOVLW	b'00111111' ; L2
	MOVWF	0x2A
	MOVLW	b'00011111' ; L3
	MOVWF	0x2B
	MOVLW	b'00001111' ; L4
	MOVWF	0x2C
	MOVLW	b'00000111' ; L5
	MOVWF	0x2D
	MOVLW	b'00000011' ; L6
	MOVWF	0x2E
	MOVLW	b'00000001'	; L7
	MOVWF	0x2F

	; FIG 2
	MOVLW	b'11111111'	; L0
	MOVWF	0x30
	MOVLW	b'11111110'	; L1
	MOVWF	0x31
	MOVLW	b'11111100' ; L2
	MOVWF	0x32
	MOVLW	b'11111000' ; L3
	MOVWF	0x33
	MOVLW	b'11110000' ; L4
	MOVWF	0x34
	MOVLW	b'11100000' ; L5
	MOVWF	0x35
	MOVLW	b'11000000' ; L6
	MOVWF	0x36
	MOVLW	b'10000000'	; L7
	MOVWF	0x37

	; FIG 3
	MOVLW	b'10000000'	; L0
	MOVWF	0x38
	MOVLW	b'11000000' ; L1
	MOVWF	0x39
	MOVLW	b'11100000' ; L2
	MOVWF	0x3A
	MOVLW	b'11110000' ; L3
	MOVWF	0x3B
	MOVLW	b'11111000' ; L4
	MOVWF	0x3C
	MOVLW	b'11111100' ; L5
	MOVWF	0x3D
	MOVLW	b'11111110'	; L6
	MOVWF	0x3E
	MOVLW	b'11111111'	; L7
	MOVWF	0x3F
	
	; FIG 4
	MOVLW	b'00000001'	; L7
	MOVWF	0x40
	MOVLW	b'00000011' ; L6
	MOVWF	0x41
	MOVLW	b'00000111' ; L5
	MOVWF	0x42
	MOVLW	b'00001111' ; L4
	MOVWF	0x43
	MOVLW	b'00011111' ; L3
	MOVWF	0x44
	MOVLW	b'00111111' ; L2
	MOVWF	0x45
	MOVLW	b'01111111'	; L1
	MOVWF	0x46
	MOVLW	b'11111111'	; L0
	MOVWF	0x47
	RETURN

PREPARE_DATA_FIG_1
	; Cargar offset de las lineas
	MOVLW	.8	
	MOVWF	0xA0
	MOVLW	.7	
	MOVWF	0xA1
	MOVLW	.7
	MOVWF	0xA2
	MOVLW	.8
	MOVWF	0xA3
	MOVLW	.10
	MOVWF	0xA4
	MOVLW	.13
	MOVWF	0xA5
	MOVLW	.17
	MOVWF	0xA6
	MOVLW	.22
	MOVWF	0xA7

	; Cargar pesos
	MOVLW	.1
	MOVWF	0xA8

	MOVLW	.1
	MOVWF	0xA9
	MOVLW	.2
	MOVWF	0xAA

	MOVLW	.1
	MOVWF	0xAB
	MOVLW	.2
	MOVWF	0xAC
	MOVLW	.2
	MOVWF	0xAD

	MOVLW	.1
	MOVWF	0xAE
	MOVLW	.2
	MOVWF	0xAF
	MOVLW	.2
	MOVWF	0xB0
	MOVLW	.4
	MOVWF	0xB1

	MOVLW	.1
	MOVWF	0xB2
	MOVLW	.2
	MOVWF	0xB3
	MOVLW	.2
	MOVWF	0xB4
	MOVLW	.4
	MOVWF	0xB5
	MOVLW	.8
	MOVWF	0xB6

	MOVLW	.1
	MOVWF	0xB7
	MOVLW	.2
	MOVWF	0xB8
	MOVLW	.2
	MOVWF	0xB9
	MOVLW	.4
	MOVWF	0xBA
	MOVLW	.8
	MOVWF	0xBB
	MOVLW	.16
	MOVWF	0xBC

	MOVLW	.1
	MOVWF	0xBD
	MOVLW	.2
	MOVWF	0xBE
	MOVLW	.2
	MOVWF	0xBF
	MOVLW	.4
	MOVWF	0xC0
	MOVLW	.8
	MOVWF	0xC1
	MOVLW	.16
	MOVWF	0xC2
	MOVLW	.32
	MOVWF	0xC3
	RETURN

PREPARE_DATA_FIG_2
	; Cargar offset de las lineas
	MOVLW	.8
	MOVWF	0xC4
	MOVLW	.7
	MOVWF	0xC5
	MOVLW	.7
	MOVWF	0xC6
	MOVLW	.8
	MOVWF	0xC7
	MOVLW	.10
	MOVWF	0xC8
	MOVLW	.13
	MOVWF	0xC9
	MOVLW	.17
	MOVWF	0xCA
	MOVLW	.22
	MOVWF	0xCB

	; Cargar pesos
	MOVLW	.1
	MOVWF	0xCC

	MOVLW	.2
	MOVWF	0xCD
	MOVLW	.1
	MOVWF	0xCE

	MOVLW	.2
	MOVWF	0xCF
	MOVLW	.2
	MOVWF	0xD0
	MOVLW	.1
	MOVWF	0xD1

	MOVLW	.4
	MOVWF	0xD2
	MOVLW	.2
	MOVWF	0xD3
	MOVLW	.2
	MOVWF	0xD4
	MOVLW	.1
	MOVWF	0xD5

	MOVLW	.8
	MOVWF	0xD6
	MOVLW	.4
	MOVWF	0xD7
	MOVLW	.2
	MOVWF	0xD8
	MOVLW	.2
	MOVWF	0xD9
	MOVLW	.1
	MOVWF	0xDA

	MOVLW	.16
	MOVWF	0xDB
	MOVLW	.8
	MOVWF	0xDC
	MOVLW	.4
	MOVWF	0xDD
	MOVLW	.2
	MOVWF	0xDE
	MOVLW	.2
	MOVWF	0xDF
	MOVLW	.1
	MOVWF	0xE0

	MOVLW	.32
	MOVWF	0xE1
	MOVLW	.16
	MOVWF	0xE2
	MOVLW	.8
	MOVWF	0xE3
	MOVLW	.4
	MOVWF	0xE4
	MOVLW	.2
	MOVWF	0xE5
	MOVLW	.2
	MOVWF	0xE6
	MOVLW	.1
	MOVWF	0xE7
	RETURN

PREPARE_DATA_FIG_3
	; Cargar offset de las lineas
	MOVLW	.8
	MOVWF	0x120
	MOVLW	.14
	MOVWF	0x121
	MOVLW	.19
	MOVWF	0x122
	MOVLW	.23
	MOVWF	0x123
	MOVLW	.26
	MOVWF	0x124
	MOVLW	.28
	MOVWF	0x125
	MOVLW	.29
	MOVWF	0x126
	MOVLW	.1
	MOVWF	0x127
	
	; Cargar pesos
	MOVLW	.32
	MOVWF	0x128
	MOVLW	.16
	MOVWF	0x129
	MOVLW	.8
	MOVWF	0x12A
	MOVLW	.4
	MOVWF	0x12B
	MOVLW	.2
	MOVWF	0x12C
	MOVLW	.2
	MOVWF	0x12D
	MOVLW	.1
	MOVWF	0x12E

	MOVLW	.16
	MOVWF	0x12F
	MOVLW	.8
	MOVWF	0x130
	MOVLW	.4
	MOVWF	0x131
	MOVLW	.2
	MOVWF	0x132
	MOVLW	.2
	MOVWF	0x133
	MOVLW	.1
	MOVWF	0x134

	MOVLW	.8
	MOVWF	0x135
	MOVLW	.4
	MOVWF	0x136
	MOVLW	.2
	MOVWF	0x137
	MOVLW	.2
	MOVWF	0x138
	MOVLW	.1
	MOVWF	0x139

	MOVLW	.4
	MOVWF	0x13A
	MOVLW	.2
	MOVWF	0x13B
	MOVLW	.2
	MOVWF	0x13C
	MOVLW	.1
	MOVWF	0x13D

	MOVLW	.2
	MOVWF	0x13E
	MOVLW	.2
	MOVWF	0x13F
	MOVLW	.1
	MOVWF	0x140

	MOVLW	.2
	MOVWF	0x141
	MOVLW	.1
	MOVWF	0x142

	MOVLW	.1
	MOVWF	0x143
	RETURN
PREPARE_DATA_FIG_4
	; Cargar offset de las lineas
	MOVLW	.8
	MOVWF	0x144
	MOVLW	.14
	MOVWF	0x145
	MOVLW	.19
	MOVWF	0x146
	MOVLW	.23
	MOVWF	0x147
	MOVLW	.26
	MOVWF	0x148
	MOVLW	.28
	MOVWF	0x149
	MOVLW	.29
	MOVWF	0x14A
	MOVLW	.1
	MOVWF	0x14B

	; Cargar pesos
	MOVLW	.1
	MOVWF	0x14C
	MOVLW	.2
	MOVWF	0x14D
	MOVLW	.2
	MOVWF	0x14E
	MOVLW	.4
	MOVWF	0x14F
	MOVLW	.8
	MOVWF	0x150
	MOVLW	.16
	MOVWF	0x151
	MOVLW	.32
	MOVWF	0x152

	MOVLW	.1
	MOVWF	0x153
	MOVLW	.2
	MOVWF	0x154
	MOVLW	.2
	MOVWF	0x155
	MOVLW	.4
	MOVWF	0x156
	MOVLW	.8
	MOVWF	0x157
	MOVLW	.16
	MOVWF	0x158

	MOVLW	.1
	MOVWF	0x159
	MOVLW	.2
	MOVWF	0x15A
	MOVLW	.2
	MOVWF	0x15B
	MOVLW	.4
	MOVWF	0x15C
	MOVLW	.8
	MOVWF	0x15D

	MOVLW	.1
	MOVWF	0x15E
	MOVLW	.2
	MOVWF	0x15F
	MOVLW	.2
	MOVWF	0x160
	MOVLW	.4
	MOVWF	0x161

	MOVLW	.1
	MOVWF	0x162
	MOVLW	.2
	MOVWF	0x163
	MOVLW	.2
	MOVWF	0x164

	MOVLW	.1
	MOVWF	0x165
	MOVLW	.2
	MOVWF	0x166

	MOVLW	.1
	MOVWF	0x167
	RETURN

ADD_OFFSET
	MOVF	LINE_SEL,W
	ADDWF	FSR,F
	MOVF	INDF,W
	ADDWF	FSR,F
	RETURN

GET_WEIGHT
	BTFSS	L_COMB,0	; Si se esperaba encendido y se recibio encendido o se esperaba apagado y se recibio apagado
		RETLW	.0		; No hay error
	BTFSC	L_SUB,0		; Si se esperaba bit encendido pero se recibio apagado
		RETLW 	.1		; Peso por defecto, si el patron dice que el bit debe estar encendido pero esta apagado
	MOVF	INDF,W
	RETURN

ANALYSE_LINE
	CLRF	ERROR_L
	CLRF	CONTADOR

	MOVF	LINE,W
	MOVWF	L_COMB		; Limpiar resultados anteriores

	MOVF	L_PATT,W
	MOVWF	L_SUB
	XORWF	L_COMB,W	; Combinar el patron buscado con la linea actual, 0 si el bit esperado es igual al recibido, 1 en cualquier otro caso
	MOVWF	L_COMB
	ANDWF	L_SUB,F		; De los bits que son diferente a lo esperado filtrar los que se esperaban encendidos y estan apagados para darles un peso por defecto

	CALL ADD_OFFSET	; Anade offset de linea
	SUM_ERRORS
		MOVLW	.8
		SUBWF	CONTADOR,W
		BTFSC	STATUS,C	; Si se realizo un prestamo
			RETURN
		CALL	GET_WEIGHT
		ADDWF	ERROR_L,F
		BTFSS	L_PATT,0
			INCF	FSR,F
		RRF		L_PATT,F
		RRF		L_COMB,F
		RRF		L_SUB,F
		INCF	CONTADOR,F
		GOTO	SUM_ERRORS

LOAD_L_PATT
	MOVWF	FSR			; Mover puntero al inicio del patron de la figura
	MOVF	LINE_SEL,W	
	ADDWF	FSR,F		; Moverse al index
	MOVF	INDF,W		; Obtener patron en el indice seleccionado
	MOVWF	L_PATT		; Cargar a la variable patron
	RETURN
GET_MIN
	MOVLW	ERROR_FIG_1		; Apuntar a ERR_1
	MOVWF	FSR
	
	MOVF	ERROR_FIG_2,W
	SUBWF	INDF,W
	MOVLW	ERROR_FIG_2
	BTFSC	STATUS,C
		MOVWF	FSR
	MOVF	ERROR_FIG_3,W
	SUBWF	INDF,W
	MOVLW	ERROR_FIG_3
	BTFSC	STATUS,C
		MOVWF	FSR
	MOVF	ERROR_FIG_4,W
	SUBWF	INDF,W
	MOVLW	ERROR_FIG_4
	BTFSC	STATUS,C
		MOVWF	FSR
	MOVLW	ERROR_FIG_1
	SUBWF	FSR,W
	MOVWF	PORTC
	RETURN
	
REINICIAR_CONTEO
	CLRF	LINE_SEL
	CALL	GET_MIN
	CLRF	ERROR_FIG_1
	CLRF	ERROR_FIG_2
	CLRF	ERROR_FIG_3
	CLRF	ERROR_FIG_4
	RETURN
WAIT_ARDUINO_RESPONSE
	MOVLW	0xFF    			; Iniciar valores para delay
	MOVWF 	R0
	MOVLW	0x80    			; Iniciar valores para delay
	MOVWF 	R1
WAIT_RESPONSE_LOOP
	DECFSZ	R0,F
		GOTO	WAIT_RESPONSE_LOOP
	DECFSZ	R1,F
		GOTO	WAIT_RESPONSE_LOOP
	RETURN
LOOP
	BCF		STATUS,IRP	; Banco 0,1 indirect address
	MOVLW	.8
	SUBWF	LINE_SEL,W
	BTFSC	STATUS,C	; Si se realizo un prestamo
		CALL 	REINICIAR_CONTEO

	MOVF	LINE_SEL,W	; Comunicar al otro equipo que linea queremos leer
	MOVWF	PORTB
	CALL	WAIT_ARDUINO_RESPONSE	; Tiempo de gracia
	MOVF	PORTD,W		; Leer linea
	MOVWF	LINE

	;FIG_1
	MOVLW	0x28		; Apuntar a inicio de patron
	CALL	LOAD_L_PATT
	MOVLW	0xA0		; Cargar direccion de los pesos/offsets
	MOVWF	FSR			; En FSR
	CALL	ANALYSE_LINE
	MOVF	ERROR_L,W
	ADDWF	ERROR_FIG_1,F

	;FIG_2
	MOVLW	0x30		; Apuntar a inicio de patron
	CALL	LOAD_L_PATT
	MOVLW	0xC3		; Cargar direccion de los pesos/offsets
	MOVWF	FSR			; En FSR
	CALL	ANALYSE_LINE
	MOVF	ERROR_L,W
	ADDWF	ERROR_FIG_2,F

	BCF		STATUS,IRP	; Banco 0,1 indirect address

	;FIG_3
	MOVLW	0x38		; Apuntar a inicio de patron
	CALL	LOAD_L_PATT
	BSF		STATUS,IRP	; Banco 2,3 indirect address
	MOVLW	0x120		; Cargar direccion de los pesos/offsets
	MOVWF	FSR			; En FSR
	CALL	ANALYSE_LINE
	MOVF	ERROR_L,W
	ADDWF	ERROR_FIG_3,F

	BCF		STATUS,IRP	; Banco 0,1 indirect address

	;FIG_4
	MOVLW	0x40		; Apuntar a inicio de patron
	CALL	LOAD_L_PATT
	BSF		STATUS,IRP	; Banco 2,3 indirect address
	MOVLW	0x143		; Cargar direccion de los pesos
	MOVWF	FSR			; En FSR
	CALL	ANALYSE_LINE
	MOVF	ERROR_L,W
	ADDWF	ERROR_FIG_4,F
	
	INCF	LINE_SEL,F
	GOTO 	LOOP
	END