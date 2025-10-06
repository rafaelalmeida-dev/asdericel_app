import { application } from "./application"

// Carrega automaticamente todos os controllers
const controllers = import.meta.globEager("./**/*_controller.js")

for (const path in controllers) {
  const name = path.replace("./", "").replace("_controller.js", "")
  application.register(name, controllers[path].default)
}
