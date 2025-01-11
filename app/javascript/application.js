// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

import "controllers";

document.addEventListener("DOMContentLoaded", () => {
  const openModalBtn = document.getElementById("open-modal-btn");
  const closeModalBtn = document.getElementById("close-modal-btn");
  const modal = document.getElementById("item-modal");

  if (openModalBtn && closeModalBtn && modal) {
    // Abrir o modal
    openModalBtn.addEventListener("click", () => {
      modal.style.display = "block";
    });

    // Fechar o modal
    closeModalBtn.addEventListener("click", () => {
      modal.style.display = "none";
    });

    // Fechar o modal ao clicar fora dele
    window.addEventListener("click", (event) => {
      if (event.target === modal) {
        modal.style.display = "none";
      }
    });
  }
});

document.addEventListener("DOMContentLoaded", () => {
  const input = document.querySelector("#filter-input");
  const searchButton = document.querySelector("#search-button");
  const clearButton = document.querySelector("#clear-button");
  const items = document.querySelectorAll("#items li");

  const filterItems = () => {
    const query = input.value.toLowerCase().trim();
    items.forEach((item) => {
      const name = item.querySelector("h2").textContent.toLowerCase().trim();
      if (name.includes(query)) {
        item.style.display = "flex";
      } else {
        item.style.display = "none";
      }
    });

    console.log(items);
  };

  searchButton.addEventListener("click", filterItems);
  input.addEventListener("input", filterItems);

  clearButton.addEventListener("click", () => {
    input.value = "";
    items.forEach((item) => {
      item.style.display = "flex";
    });
  });
});

document.addEventListener("DOMContentLoaded", () => {
  const menuToggle = document.getElementById("menu-toggle");
  const menuContent = document.getElementById("menu-content");

  menuToggle.addEventListener("click", function () {
    menuContent.classList.toggle("hidden");
  });

  document.addEventListener("click", function (event) {
    if (
      !menuToggle.contains(event.target) &&
      !menuContent.contains(event.target)
    ) {
      menuContent.classList.add("hidden");
    }
  });
});
