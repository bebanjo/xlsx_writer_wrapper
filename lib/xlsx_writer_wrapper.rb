require "ffi"
require "rbconfig"

module XlsxWriterWrapper
  def library_path
    @library_path ||= begin
      if os == :macosx
        File.dirname(__FILE__) + "/libxlsxwriter.dylib"
      else
        File.dirname(__FILE__) + "/libxlsxwriter.so"
      end
    end
  end
  module_function :library_path

  private

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
        raise "unknown os: #{host_os.inspect}"
      end
    )
  end
  module_function :os
end

require "xlsx_writer_wrapper/version"
require "xlsx_writer_wrapper/utility"
require "xlsx_writer_wrapper/format"
require "xlsx_writer_wrapper/worksheet"
require "xlsx_writer_wrapper/workbook"

