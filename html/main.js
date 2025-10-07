const wasm = await WebAssembly.instantiateStreaming(fetch("mul_add.wasm"));

const { mul_add } = wasm.instance.exports;

document.getElementById("compute").addEventListener("click", () => {
  const x = parseInt(document.getElementById("x").value);
  const y = parseInt(document.getElementById("y").value);
  const z = parseInt(document.getElementById("z").value);

  const result = mul_add(x, y, z);
  document.getElementById("result").textContent = result;
});


const wasm2 = await WebAssembly.instantiateStreaming(fetch("loop.wasm"));

const { loop_add } = wasm2.instance.exports;

window.loop_add = loop_add;