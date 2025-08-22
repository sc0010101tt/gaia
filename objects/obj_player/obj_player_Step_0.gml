// Handle movement
var h = keyboard_check(vk_right) - keyboard_check(vk_left);
var v = keyboard_check(vk_down) - keyboard_check(vk_up);
x += h * speed;
y += v * speed;

// Interaction key
if (keyboard_check_pressed(ord("E"))) {
    // Pick up seeds
    var seed = instance_place(x, y, obj_seed);
    if (seed != noone) {
        inventory["seeds"] += seed.amount;
        with (seed) instance_destroy();
    } else {
        // Plant seeds on field
        var field = instance_place(x, y, obj_field);
        if (field != noone && inventory["seeds"] > 0 && !field.planted) {
            inventory["seeds"] -= 1;
            field.planted = true;
            instance_create_layer(field.x, field.y, "Instances", obj_plant);
        }
    }
}
