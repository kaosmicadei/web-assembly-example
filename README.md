# web-assembly-example
Diving into WebAssembly rabbit hole.

## mul_add.wasm
```
00 61 73 6d  ;; magic number '\0asm' 
01 00 00 00  ;; version 1

01           ;; Type
08           ;; payload length (8 bytes)
01           ;; type count = 1
60           ;; type form = function
03 7f 7f 7f  ;; three inputs i32
01 7f        ;; one output i32

03           ;; Function
02           ;; payload length (2 bytes)
01           ;; function count = 1
00           ;; type id = 0

07           ;; Export
0b           ;; payload length (11 bytes)
01           ;; export count = 1
07           ;; name length (7 bytes)
6d 75 6c 5f  ;; "mul_"
61 64 64     ;; "add"
00           ;; export kind = function
00           ;; function id = 0

0a           ;; Code 
0c           ;; payload length (12 bytes)
01           ;; function count = 1
0a           ;; function body length (10 bytes)
00           ;; local declarations count = 0 (no local variables)

;; Instructions
20 00        ;; push $a (variable indices follows declaration order)
20 01        ;; push $b
6c           ;; i32.mul
20 02        ;; push $z
6a           ;; i32.add
0b           ;; end (function)

;; implicity return of the last valu on the stack
```

## loop.wasm
```
00 61 73 6d  ;; magic number
01 00 00 00  ;; version 1

01           ;; Type
08           ;; payload lentgh (8 bytes)
01           ;; type count = 1
60           ;; type form = function
03 7f 7f 7f  ;; three inputs i32
01 7f        ;; one return i32

03           ;; Function
02           ;; payload length (2 bytes)
01           ;; function count = 1
00           ;; type id = 0

07           ;; Export
0c           ;; payload length (12 bytes)
01           ;; export count = 1
08           ;; name size
6c 6f 6f 70  ;; "l o o p"
5f 61 64 64  ;; "_ a d d"
00           ;; export kind = function
00           ;; function id = 0

0a           ;; Code
24           ;; payload length (36 bytes)
01           ;; function count = 1
22           ;; function body length (34 bytes)

01           ;; local declarations count = 1 entry
02 7f        ;; 2 varaibles i32 (both initialized with 0)

;; Instructions
20 00        ;; push $init
21 04        ;; set $acc with the value on the top of stack (var 0) 

03           ;; begin of the loop
40           ;; block return = void

20 03        ;; push $i
41 01        ;; i32.constant 1
6a           ;; i32.add
21 03        ;; set $i with the top of stack (result of add)

20 04        ;; push $acc
20 01        ;; push $step
6a           ;; i32.add
21 04        ;; set $acc

20 03        ;; push $i
20 02        ;; push $repeat
48           ;; i32.lt_s (less than signed)
0d 00        ;; br_if 00 -> branch if true to $main_loop
0b           ;; end ($main_loop)

20 04        ;; push $acc to the stack for implicity return
0b           ;; end (function)
```