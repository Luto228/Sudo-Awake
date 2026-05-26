/// @description: draw terminal
if (global.terminal_active == true) {

    var _gui_width = display_get_gui_width();
    var _gui_height = display_get_gui_height();
    

    draw_set_color(c_black);
    
    draw_rectangle(0, _gui_height - 40, _gui_width, _gui_height, false);

    draw_set_color(c_green);
    
    draw_text(15, _gui_height - 30, "> " + terminal_str);   
}