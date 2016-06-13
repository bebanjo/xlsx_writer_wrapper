require "ffi"
require "rbconfig"

def os
  @os ||= (
    host_os = RbConfig::CONFIG['host_os']
    case host_os
    when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
      :windows
    when /darwin|mac os/
      :macosx
    when /linux/
      :linux
    when /solaris|bsd/
      :unix
    else
      raise Error::WebDriverError, "unknown os: #{host_os.inspect}"
    end
  )
end

module XlsxWriterWrapper
  if os == :macosx
    C_LIBRARY_PATH = File.dirname(__FILE__) + "/libxlsxwriter.dylib"
  else
    C_LIBRARY_PATH = File.dirname(__FILE__) + "/libxlsxwriter.so"
  end
end

require "xlsx_writer_wrapper/version"
require "xlsx_writer_wrapper/utility"
require "xlsx_writer_wrapper/format"
require "xlsx_writer_wrapper/worksheet"
require "xlsx_writer_wrapper/workbook"

