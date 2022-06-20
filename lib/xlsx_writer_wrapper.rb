require "ffi"
require "rbconfig"

module XlsxWriterWrapper
  def library_path
    @library_path ||= begin
      if os == :macosx
        case cpu
        when :arm
          File.dirname(__FILE__) + "/libxlsxwriter.dylib"
        when :intel
          File.dirname(__FILE__) + "/libxlsxwriterintel.dylib"
        end
      else
        case cpu
        when :intel
          File.dirname(__FILE__) + "/libxlsxwriter.so"
        when :aarch64
          File.dirname(__FILE__) + "/libxlsxwriteraarch64.so"
        end
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

  def cpu
    @cpu ||= (
      host_cpu = RbConfig::CONFIG['host_cpu']
      case host_cpu
      when "x86_64"
        :intel
      when "arm"
        :arm
      when "aarch64"
        :aarch64
      end
    )
  end
  module_function :cpu
end

require "xlsx_writer_wrapper/version"
require "xlsx_writer_wrapper/utility"
require "xlsx_writer_wrapper/format"
require "xlsx_writer_wrapper/worksheet"
require "xlsx_writer_wrapper/workbook"

