require "ffi"
require "rbconfig"

module XlsxWriterWrapper
  def library_path
    base_dir = File.dirname(__FILE__)
    @library_path ||=
      begin
        case os
        when :macosx
          case cpu
          when :arm
            "#{base_dir}/libxlsxwriter.dylib"
          when :intel
            "#{base_dir}/libxlsxwriterintel.dylib"
          end
        else
          case cpu
          when :arm
            "#{base_dir}/libxlsxwriter_arm.so"
          when :intel
            "#{base_dir}/libxlsxwriter.so"
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
      when /arm|aarch64/
        :arm
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

