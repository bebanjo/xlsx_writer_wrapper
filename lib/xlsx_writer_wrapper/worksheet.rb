module XlsxWriterWrapper
  module Worksheet
    extend FFI::Library

    ffi_lib XlsxWriterWrapper::C_LIBRARY_PATH

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
