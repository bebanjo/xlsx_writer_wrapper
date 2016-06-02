module XlsxWriterWrapper
  module Workbook
    extend FFI::Library

    ffi_lib XlsxWriterWrapper::C_LIBRARY_PATH

    class WorkbookOptions < FFI::Struct
      layout :constant_memory, :uint8
    end

    attach_function :workbook_new, [:string], :pointer
    attach_function :workbook_new_opt, [:string, :pointer], :pointer
    attach_function :workbook_add_worksheet, [:pointer, :string], :pointer
    attach_function :workbook_add_format, [:pointer], :pointer
    attach_function :workbook_close, [:pointer], :uint8
    attach_function :workbook_set_properties, [:pointer, :pointer], :uint8
    attach_function :workbook_define_name, [:pointer, :string, :string], :uint8
  end
end
