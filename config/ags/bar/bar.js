import { trails } from "./modules/trails.js"
import { volume } from "./modules/volume.js"

export const bar = Widget.Window({
    name: 'bar',
    class_name: "bar",
    anchor: ['top', 'left', 'right'],
    child: Widget.CenterBox({
        spacing: 8,
        vertical: false,
        startWidget: Widget.Box({
            class_name:"left-box",
            hpack: "start",
            spacing: 8,
            children: [
                trails,
                volume
            ],
        }),
        centerWidget: Widget.Label('center widget'),
        endWidget: Widget.Label('right widget'),
    }),
})