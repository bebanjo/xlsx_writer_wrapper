module XlsxWriterWrapper
  class Workbook
    extend FFI::Library

    ffi_lib XlsxWriterWrapper::C_LIBRARY_PATH

    class Options < FFI::Struct
      layout :constant_memory, :uint8
    end

    attr_reader :workbook_pointer

    def initialize(filename, options = Options.new)
      @filename = filename
      @workbook_pointer = workbook_new_opt(filename, options)
      @worksheets = []
    end

    def add_worksheet(worksheet_name)
      worksheet_pointer = workbook_add_worksheet(workbook_pointer, worksheet_name)
      worksheet = Worksheet.new(worksheet_pointer, worksheet_name)
      @worksheets << worksheet
      worksheet
    end

    def add_format
      format_pointer = workbook_add_format(workbook_pointer)
      Format.new(format_pointer)
    end

    def worksheets
      @worksheets
    end

    def close
      workbook_close(workbook_pointer)
    end

    private

    attach_function :workbook_new, [:string], :pointer
    attach_function :workbook_new_opt, [:string, :pointer], :pointer
    attach_function :workbook_add_worksheet, [:pointer, :string], :pointer
    attach_function :workbook_add_format, [:pointer], :pointer
    attach_function :workbook_close, [:pointer], :uint8
    attach_function :workbook_set_properties, [:pointer, :pointer], :uint8
    attach_function :workbook_define_name, [:pointer, :string, :string], :uint8
  end
end
