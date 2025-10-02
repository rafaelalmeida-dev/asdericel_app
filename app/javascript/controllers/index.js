// app/javascript/controllers/index.js
import { application } from "./application"

function importAll(r) {
  r.keys().forEach(r)
}

// Importa todos os arquivos JS dentro de controllers, exceto application.js
importAll(require.context(".", true, /^(?!.*application).*\.js$/))
