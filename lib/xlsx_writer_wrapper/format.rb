module XlsxWriterWrapper
  class Format
    extend FFI::Library

    ffi_lib XlsxWriterWrapper::C_LIBRARY_PATH

    lxw_format_underlines = enum(:lxw_underline_single, 1,
                                :lxw_underline_double,
                                :lxw_underline_single_accounting,
                                :lxw_underline_double_accounting)

    lxw_format_scripts = enum(:lxw_font_superscript, 1,
                            :lxw_font_subscript)

    lxw_format_alignments = enum(:lxw_align_none, 0,
                                :lxw_align_left,
                                :lxw_align_center,
                                :lxw_align_right,
                                :lxw_align_fill,
                                :lxw_align_justify,
                                :lxw_align_center_across,
                                :lxw_align_distributed,
                                :lxw_align_vertical_top,
                                :lxw_align_vertical_bottom,
                                :lxw_align_vertical_center,
                                :lxw_align_vertical_justify,
                                :lxw_align_vertical_distributed)

    lxw_format_diagonal_types = enum(:lxw_diagonal_border_up, 1,
                                    :lxw_diagonal_border_down,
                                    :lxw_diagonal_border_up_down)

    lxw_defined_colors = enum(:lxw_color_black, 0x000000,
                              :lxw_color_blue, 0x0000FF,
                              :lxw_color_brown, 0x800000,
                              :lxw_color_cyan, 0x00FFFF,
                              :lxw_color_gray, 0x808080,
                              :lxw_color_green, 0x008000,
                              :lxw_color_lime, 0x00FF00,
                              :lxw_color_magenta, 0xFF00FF,
                              :lxw_color_navy, 0x000080,
                              :lxw_color_orange, 0xFF6600,
                              :lxw_color_pink, 0xFF00FF,
                              :lxw_color_purple, 0x800080,
                              :lxw_color_red, 0xFF0000,
                              :lxw_color_silver, 0xC0C0C0,
                              :lxw_color_white, 0xFFFFFF,
                              :lxw_color_yellow, 0xFFFF00)

    lxw_format_patterns = enum(:lxw_pattern_none, 0,
                              :lxw_pattern_solid,
                              :lxw_pattern_medium_gray,
                              :lxw_pattern_dark_gray,
                              :lxw_pattern_light_gray,
                              :lxw_pattern_dark_horizontal,
                              :lxw_pattern_dark_vertical,
                              :lxw_pattern_dark_down,
                              :lxw_pattern_dark_up,
                              :lxw_pattern_dark_grid,
                              :lxw_pattern_dark_trellis,
                              :lxw_pattern_light_horizontal,
                              :lxw_pattern_light_vertical,
                              :lxw_pattern_light_down,
                              :lxw_pattern_light_up,
                              :lxw_pattern_light_grid,
                              :lxw_pattern_light_trellis,
                              :lxw_pattern_gray_125,
                              :lxw_pattern_gray_0625)


    lxw_format_borders = enum(:lxw_border_none,
                              :lxw_border_thin,
                              :lxw_border_medium,
                              :lxw_border_dashed,
                              :lxw_border_dotted,
                              :lxw_border_thick,
                              :lxw_border_double,
                              :lxw_border_hair,
                              :lxw_border_medium_dashed,
                              :lxw_border_dash_dot,
                              :lxw_border_medium_dash_dot,
                              :lxw_border_dash_dot_dot,
                              :lxw_border_medium_dash_dot_dot,
                              :lxw_border_slant_dash_dot)
  end
end
