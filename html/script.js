window.addEventListener("message", function (event) {
  if (event.data.action === "open") {
    document.body.style.display = "flex";
  } else if (event.data.action === "close") {
    document.body.style.display = "none";
  }
});

function submit() {
  const label = document.getElementById("label").value;
  const sprite = document.getElementById("sprite").value;
  const color = document.getElementById("color").value;
  const scale = document.getElementById("scale").value;

  fetch(`https://${GetParentResourceName()}/createBlip`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ label, sprite, color, scale })
  });
}

function closeUI() {
  fetch(`https://${GetParentResourceName()}/closeUI`, {
    method: "POST",
  });
}
