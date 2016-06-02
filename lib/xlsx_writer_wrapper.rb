require "ffi"

module XlsxWriterWrapper
  C_LIBRARY_PATH = File.dirname(__FILE__) + "/libxlsxwriter.dylib"
end

require "xlsx_writer_wrapper/version"
require "xlsx_writer_wrapper/utility"
require "xlsx_writer_wrapper/format"
require "xlsx_writer_wrapper/worksheet"
require "xlsx_writer_wrapper/workbook"

