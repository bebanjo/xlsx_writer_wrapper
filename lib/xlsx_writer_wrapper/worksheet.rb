module XlsxWriterWrapper
  class Worksheet
    extend FFI::Library

    ffi_lib XlsxWriterWrapper::C_LIBRARY_PATH

    attr_reader :worksheet_pointer

    def initialize(worksheet_pointer, worksheet_name)
      @worksheet_name = worksheet_name
      @worksheet_pointer = worksheet_pointer
    end

    def write_string(row, column, value, format = nil)
      worksheet_write_string(worksheet_pointer, row, column, value, format && format.format_pointer)
    end

    def write_number(row, column, value, format = nil)
      worksheet_write_number(worksheet_pointer, row, column, value, format && format.format_pointer)
    end

    def write_boolean(row, column, value, format = nil)
      worksheet_write_boolean(worksheet_pointer, row, column, value, format && format.format_pointer)
    end

    def write_datetime(row, column, value, format = nil)
      worksheet_write_datetime(worksheet_pointer, row, column, value, format && format.format_pointer)
    end

    def write_blank(row, column, format = nil)
      worksheet_write_blank(worksheet_pointer, row, column, format && format.format_pointer)
    end

    def write_formula(row, column, value, format = nil)
      worksheet_write_formula(worksheet_pointer, row, column, value, format && format.format_pointer)
    end

    def write_formula_num(row, column, value, result, format = nil)
      worksheet_write_formula_num(worksheet_pointer, row, column, value, format, result)
    end

    def write_url(row, column, value, format = nil)
      worksheet_write_url(worksheet_pointer, row, column, value, format && format.format_pointer)
    end

    def set_column(first_column, last_column, width, format = nil)
      worksheet_set_column(worksheet_pointer, first_column, last_column, width, format && format.format_pointer)
    end

    def set_row(row, height, format = nil)
      worksheet_set_row(worksheet_pointer, row, height, format && format.format_pointer)
    end

    private

    attach_function :worksheet_write_array_formula, [:pointer, :uint32, :uint16, :uint32, :uint16, :string, :pointer], :int8
    attach_function :worksheet_write_blank, [:pointer, :uint32, :uint16, :pointer], :int8
    attach_function :worksheet_write_boolean, [:pointer, :uint32, :uint16, :int, :pointer], :int8
    attach_function :worksheet_write_datetime, [:pointer, :uint32, :uint16, :pointer, :pointer], :int8
    attach_function :worksheet_write_formula, [:pointer, :uint32, :uint16, :string, :pointer], :int8
    attach_function :worksheet_write_formula_num, [:pointer, :uint32, :uint16, :string, :pointer, :double], :int8
    attach_function :worksheet_write_number, [:pointer, :uint32, :uint16, :double, :pointer], :int8
    attach_function :worksheet_write_string, [:pointer, :uint32, :uint16, :string, :pointer], :int8
    attach_function :worksheet_write_url, [:pointer, :uint32, :uint16, :pointer, :pointer], :int8

    attach_function :worksheet_set_column, [:pointer, :uint32, :uint16, :double, :pointer], :int8
    attach_function :worksheet_set_column_opt, [:pointer, :uint32, :uint16, :double, :pointer, :pointer], :int8
    attach_function :worksheet_set_row, [:pointer, :uint32, :double, :pointer], :int8
    attach_function :worksheet_set_row_opt, [:pointer, :uint32, :double, :pointer, :pointer], :int8
  end
end
