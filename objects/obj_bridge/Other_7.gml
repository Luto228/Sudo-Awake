/// @description: kill and stop anim
if (image_speed < 0) { 
    instance_destroy();
}

image_speed = 0;
image_index = image_number - 1;  
depth = -1;
