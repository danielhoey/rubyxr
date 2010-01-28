
module Kernel
  def requirex(file_path)
    case file_path
    when /^\.\//
      require file_path.gsub(/^\./, Rubyxr.directory(caller[0]))
    when /^\.\.\//
      require file_path.gsub(/^/, "#{Rubyxr.directory(caller[0])}/")
    else
      require file_path
    end
  end
end

module Rubyxr
  def self.directory(stack_trace_entry)
    File.dirname(stack_trace_entry.match(/(.*):\d/)[1])
  end
end


