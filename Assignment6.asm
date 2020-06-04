

comment !-------------------------------------------------------------------------------------

	6/4/2020
	
	Write a program that:
	Takes a number as an input. Prints back to the console all the primes that
	are larger than 1 but not larger than the number that has been entered.

---------------------------------------------------------------------------------------------!

INCLUDE Irvine32.inc

.data
input dword ?
prompt byte "Please enter a value: ", 0
continue byte "Press any key to continue...", 0


.code
main PROC
	mov edx, offset prompt
	call writeString
	call readDec

	mov input, eax

	;------------------------------
	;	while (ebx < input) { 
	;		call isPrime
	;		[code]
	;		inc ebx
	; }
	;------------------------------

	mov ebx, 1
	cmp ebx, input
	ja out1
	while01:
		call isPrime

		;------------------------------
		;	if (isPrime)  // eax = 1
		;		cout << ebx << ' ';
		;------------------------------
		cmp eax, 1
		jne out03
			mov eax, ebx
			call writeDec
			mov eax, ' '
			call writeChar
		out03:

		inc ebx
		cmp ebx, input
		ja out1
		jmp while01
out1:

	call crlf
	mov edx, offset continue
	call writeString
	call readChar
	call ClrScr

exit
main ENDP



;---------------------------------------------------------
; isPrime
; returns 1 if value sent is prime, returns 0 if not prime
; 
; recieves: ebx (number we are testing for prime)
; returns: eax = 1 or eax = 0
;
; note: for documentation purposes, ebx = n and ecx = i
;---------------------------------------------------------

isPrime PROC

	;------------------------------
	; if (n <= 1) 
	;	return false;   // eax = 0
	;------------------------------

	cmp ebx, 1
	ja start01
	xor eax, eax
	jmp end01

start01:

	;------------------------------
	; if (n == 2) 
	;	return true;   // eax = 1
	;------------------------------

	cmp ebx, 2
	je out02

	mov ecx, 2

	;------------------------------
	; while (i < n) { 
	;	[code]
	;	inc i
	; }
	;------------------------------
	
	while01:

		mov eax, ebx
		xor edx, edx
		div ecx

		;------------------------------
		; if (n % i == 0)
		;	return false; // eax = 0	
		;------------------------------

		cmp edx, 0
		jne out02
		xor eax, eax
		jmp end01


		; set prime true, will return true only when
		; ecx greater than ebx (value sent in)
	out02:
		mov eax, 1

		inc ecx

		cmp ecx, ebx
		jb while01
end01:


	ret		
isPrime ENDP

END main



comment !---------------------------

Please enter a value: 44
2 3 5 7 11 13 17 19 23 29 31 37 41 43
Press any key to continue...


-----------------------------------!