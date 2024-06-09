import { applauncher } from "./applauncher/applauncher.js"
import { bar } from "./bar/bar.js"

App.config({
    style: "./style.css",
    windows: [
        bar,
        applauncher
    ],
})