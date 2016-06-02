module XlsxWriterWrapper
  class Utility
    extend FFI::Library

    ffi_lib XlsxWriterWrapper::C_LIBRARY_PATH

    class DateTime < FFI::Struct
      layout :year, :int,
             :month, :int,
             :day, :int,
             :hour, :int,
             :min, :int,
             :sec, :double
    end

    def self.convert_to_datetime(time)
      ruby_datetime = time.to_datetime

      DateTime.new.tap do |datetime|
        datetime[:year] = ruby_datetime.year
        datetime[:month] = ruby_datetime.month
        datetime[:day] = ruby_datetime.day
        datetime[:hour] = ruby_datetime.hour
        datetime[:min] = ruby_datetime.min
        datetime[:sec] = ruby_datetime.sec
      end
    end
  end
end
