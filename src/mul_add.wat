;; This a WebAssembly Text file. Any similarity with LISP is not a mere
;; coincidence. ;)

(module
  ;; Define a whole module.
  
  (func $mul_add (param $a i32) (param $b i32) (param $c i32) (result i32)
    ;; Push the first two parameters onto the stack
    local.get $a
    local.get $b
    ;; Multiply the first two parameters
    i32.mul
    ;; Push the third parameter onto the stack
    local.get $c
    ;; Add the result of the multiplication to the third parameter
    i32.add
  )

  ;; NOTE: Using
  ;;    local.get $c
  ;;    local.get $b
  ;;    local.get $a
  ;;    i32.mul
  ;;    i32.add
  ;; would be equivalent. The difference is there will be no pause for pushing
  ;; a value onto the stack between the multiplication and the addition.

  (export "mul_add" (func $mul_add))
)
