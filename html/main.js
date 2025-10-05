const wasm = await WebAssembly.instantiateStreaming(fetch("example.wasm"));

const { mul_add } = wasm.instance.exports;

document.getElementById("compute").addEventListener("click", () => {
  const x = parseInt(document.getElementById("x").value);
  const y = parseInt(document.getElementById("y").value);
  const z = parseInt(document.getElementById("z").value);

  const result = mul_add(x, y, z);
  document.getElementById("result").textContent = result;
});
