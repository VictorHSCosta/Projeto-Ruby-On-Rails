// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
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
