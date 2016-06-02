module XlsxWriterWrapper
  class Format
    extend FFI::Library

    ffi_lib XlsxWriterWrapper::C_LIBRARY_PATH

    FORMAT_UNDERLINES = enum(:single, 1,
                              :double,
                              :single_accounting,
                              :double_accounting)

    FORMAT_SCRIPTS = enum(:superscript, 1,
                          :subscript)

    FORMAT_ALIGNMENTS = enum(:none, 0,
                              :left,
                              :center,
                              :right,
                              :fill,
                              :justify,
                              :center_across,
                              :distributed,
                              :vertical_top,
                              :vertical_bottom,
                              :vertical_center,
                              :vertical_justify,
                              :vertical_distributed)

    FORMAT_DIAGONAL_TYPES = enum(:border_up, 1,
                                  :border_down,
                                  :border_up_down)

    DEFINED_COLORS = enum(:black, 0x000000,
                          :blue, 0x0000FF,
                          :brown, 0x800000,
                          :cyan, 0x00FFFF,
                          :gray, 0x808080,
                          :green, 0x008000,
                          :lime, 0x00FF00,
                          :magenta, 0xFF00FF,
                          :navy, 0x000080,
                          :orange, 0xFF6600,
                          :pink, 0xFF00FF,
                          :purple, 0x800080,
                          :red, 0xFF0000,
                          :silver, 0xC0C0C0,
                          :white, 0xFFFFFF,
                          :yellow, 0xFFFF00)

    FORMAT_PATTERNS = enum(:none, 0,
                            :solid,
                            :medium_gray,
                            :dark_gray,
                            :light_gray,
                            :dark_horizontal,
                            :dark_vertical,
                            :dark_down,
                            :dark_up,
                            :dark_grid,
                            :dark_trellis,
                            :light_horizontal,
                            :light_vertical,
                            :light_down,
                            :light_up,
                            :light_grid,
                            :light_trellis,
                            :gray_125,
                            :gray_0625)

    FORMAT_BORDERS = enum(:none,
                          :thin,
                          :medium,
                          :dashed,
                          :dotted,
                          :thick,
                          :double,
                          :hair,
                          :medium_dashed,
                          :dash_dot,
                          :medium_dash_dot,
                          :dash_dot_dot,
                          :medium_dash_dot_dot,
                          :slant_dash_dot)

    attr_reader :format_pointer

    def initialize(format_pointer)
      @format_pointer = format_pointer
    end

    def set_font_name(name)
      format_set_font_name(format_pointer, name)
    end

    def set_font_size(size)
      format_set_font_size(format_pointer, size)
    end

    def set_font_color(color)
      format_set_font_color(format_pointer, color)
    end

    def set_bold
      format_set_bold(format_pointer)
    end

    def set_italic
      format_set_italic(format_pointer)
    end

    def set_underline(style)
      format_set_underline(format_pointer, style)
    end

    def set_font_strikeout
      format_set_font_strikeout(format_pointer)
    end

    def set_font_script(style)
      format_set_font_script(format_pointer, style)
    end

    def set_num_format(num_format)
      format_set_num_format(format_pointer, num_format)
    end

    def set_num_format_index(style)
      format_set_num_format_index(format_pointer, style)
    end

    def set_unlocked
      format_set_unlocked(format_pointer)
    end

    def set_hidden
      format_set_hidden(format_pointer)
    end

    def set_align(alignment)
      format_set_align(format_pointer, alignment)
    end

    def set_text_wrap
      format_set_text_wrap(format_pointer)
    end

    def set_rotation(angle)
      format_set_rotation(format_pointer, angle)
    end

    def set_indent(level)
      format_set_indent(format_pointer, level)
    end

    def set_shrink
      format_set_shrink(format_pointer)
    end

    def set_pattern(index)
      format_set_pattern(format_pointer, index)
    end

    def set_bg_color(color)
      format_set_bg_color(format_pointer, color)
    end

    def set_fg_color(color)
      format_set_fg_color(format_pointer, color)
    end

    def set_border(style)
      format_set_border(format_pointer, style)
    end

    def set_bottom(style)
      format_set_bottom(format_pointer, style)
    end

    def set_top(style)
      format_set_top(format_pointer, style)
    end

    def set_left(style)
      format_set_left(format_pointer, style)
    end

    def set_right(style)
      format_set_right(format_pointer, style)
    end

    def set_border_color(color)
      format_set_border_color(format_pointer, color)
    end

    def set_bottom_color(color)
      format_set_bottom_color(format_pointer, color)
    end

    def set_top_color(color)
      format_set_top_color(format_pointer, color)
    end

    def set_left_color(color)
      format_set_left_color(format_pointer, color)
    end

    def set_right_color(color)
      format_set_right_color(format_pointer, color)
    end

    private

    attach_function :format_set_align, [:pointer, :uint8], :void
    attach_function :format_set_bg_color, [:pointer, :int32], :void
    attach_function :format_set_bold, [:pointer], :void
    attach_function :format_set_border, [:pointer, :uint8], :void
    attach_function :format_set_border_color, [:pointer, :int32], :void
    attach_function :format_set_bottom, [:pointer, :uint8], :void
    attach_function :format_set_bottom_color, [:pointer, :int32], :void
    attach_function :format_set_fg_color, [:pointer, :int32], :void
    attach_function :format_set_font_color, [:pointer, :int32], :void
    attach_function :format_set_font_name, [:pointer, :string], :void
    attach_function :format_set_font_script, [:pointer, :uint8], :void
    attach_function :format_set_font_size, [:pointer, :uint16], :void
    attach_function :format_set_font_strikeout, [:pointer], :void
    attach_function :format_set_hidden, [:pointer, :int16], :void
    attach_function :format_set_indent, [:pointer, :uint8], :void
    attach_function :format_set_italic, [:pointer], :void
    attach_function :format_set_left, [:pointer, :uint8], :void
    attach_function :format_set_left_color, [:pointer, :int32], :void
    attach_function :format_set_num_format, [:pointer, :string], :void
    attach_function :format_set_num_format_index, [:pointer, :uint8], :void
    attach_function :format_set_pattern, [:pointer, :uint8], :void
    attach_function :format_set_right, [:pointer, :uint8], :void
    attach_function :format_set_right_color, [:pointer, :int32], :void
    attach_function :format_set_rotation, [:pointer, :int16], :void
    attach_function :format_set_shrink, [:pointer], :void
    attach_function :format_set_text_wrap, [:pointer], :void
    attach_function :format_set_top, [:pointer, :uint8], :void
    attach_function :format_set_top_color, [:pointer, :int32], :void
    attach_function :format_set_underline, [:pointer, :uint8], :void
    attach_function :format_set_unlocked, [:pointer], :void
  end
end
