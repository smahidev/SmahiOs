const hyprland = await Service.import("hyprland")


export const trails = Widget.Label({
    class_name: "trails",
    truncate:"end",
    label: hyprland.active.client.bind("title"),
})



