module LibC
  extend FFI::Library
  ffi_lib FFI::Library::LIBC
  attach_function :malloc, [:size_t], :pointer
  attach_function :free, [:pointer], :void
end

module LibInject
  extend FFI::Library
  ffi_lib_flags :now, :global
  ffi_lib "#{Dir.pwd}/../slib/libinjection.so"
  attach_function :libinjection_sqli_init, [:pointer, :string, :size_t, :int], :long
  attach_function :libinjection_is_sqli, [:pointer], :int
end

class FilterSqli
  def self.is_sqlinjection?(data)
    begin
      return 0 if data.to_s.empty?
      length = data.bytesize
      return 0 if length <= 0
      sfilter = LibC::malloc(1024)
      LibInject::libinjection_sqli_init(sfilter, data, length, 0)
      LibInject::libinjection_is_sqli(sfilter)
    rescue => e
      puts e.message, e.backtrace
    end
  end
end
