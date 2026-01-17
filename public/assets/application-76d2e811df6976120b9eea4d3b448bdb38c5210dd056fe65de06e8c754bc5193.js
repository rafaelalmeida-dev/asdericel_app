// Vendors principais (dependências base)
import "./vendor/jquery/jquery.js";

// Bootstrap (geralmente depende de jQuery)
import "./bootstrap.js";

// Outros vendors que dependem de jQuery
import "./vendor/mask.js";
import "./vendor/perfect-scrollbar/perfect-scrollbar.js";
import "./vendor/menu.js";

// Vendors independentes (podem vir a seguir)
import "./vendor/apex-charts/apexcharts.js";
import "./vendor/highlight/highlight.js";
import "./vendor/popper/popper.js";
import "./vendor/sweetalert2/sweetalert2.js";
window.Swal = window.Sweetalert2;

// Scripts customizados (seu código que usa tudo acima)
import "./custom/config.js";
import "./custom/helpers.js";
import "./custom/main.js";
import "./custom/custom.js";
