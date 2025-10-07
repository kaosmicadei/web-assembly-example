;; This a WebAssembly Text file. Any similarity with LISP is not a mere
;; coincidence. ;)

(module

  (func $loop_add (param $init i32) (param $step i32) (param $repeat i32) (result i32)
    ;; Declares a local variable $i with default value 0.
    (local $i i32)
    
    ;; Creates an accumulator and set its value to the initial value in three
    ;; steps.
    
    ;; 1. Declares a local variable $acc with 0 as default value.
    (local $acc i32)

    ;; WARNING!!! The declarations must appear together! It will not process
    ;; logic between declarations.

    ;; 2. Push the value of $init to the stack.
    local.get $init

    ;; 3. Move the value in the top of the stack to the variable $acc.
    local.set $acc

    ;; Define a referable loop block.
    (loop $main_loop
      
      ;; Increment $i.
      local.get $i
      i32.const 1
      i32.add
      local.set $i  ;; sets $i with the top of the stack (the resul of add)

      ;; Update the accumulator.
      local.get $acc
      local.get $step
      i32.add
      local.set $acc

      ;; Loop if $i < $repeat.
      local.get $i
      local.get $repeat
      i32.lt_s           ;; less than with signed
      br_if $main_loop)

    ;; At this point, there is no value in the stack so, we push the accumulator
    ;; to it in order to return its value.  
    local.get $acc)

  (export "loop_add" (func $loop_add)))
