;; This a WebAssembly Text file. Any similarity with LISP is not a mere
;; coincidence. ;)

(module
  ;; Define a whole module.
  
  (func $mul_add (param $a i32) (param $b i32) (param $c i32) (result i32)
    local.get $a
    local.get $b
    i32.mul
    local.get $c
    i32.add
  )

  (export "mul_add" (func $mul_add))
)
