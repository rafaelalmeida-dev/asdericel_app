document.addEventListener("turbo:load", () => {
  const deleteModals = document.querySelectorAll(".confirm-delete-modal");

  deleteModals.forEach(modal => {
    modal.addEventListener("show.bs.modal", event => {
      const button = event.relatedTarget;
      const resourcePath = button.getAttribute("data-resource-path");
      const form = modal.querySelector("form");
      if (form && resourcePath) {
        form.action = resourcePath;
      }
    });
  });
});

