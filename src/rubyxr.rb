
module Kernel
  def requirex(file_path)
    case file_path
    when /^\.\//
      require file_path.gsub(/^\./, Rubyxr.directory(caller[0]))
    when /^\.\.\//
      require file_path.gsub(/^/, "#{Rubyxr.directory(caller[0])}/")
    else
      require "#{Rubyxr.project_root}/#{file_path}"
    end
  rescue
    raise Rubyxr::Exception.new("Rubyxr couldn't load #{file_path}: #{$!.message}") 
  end
end


module Rubyxr
  def self.directory(stack_trace_entry)
    File.dirname(stack_trace_entry.match(/(.*):\d/)[1])
  end

  def self.project_root
    find_dir_containing('.rubyxr', directory(caller[1]))
  end

  def self.find_dir_containing(file, from_dir)
    from_dir =  File.expand_path(from_dir)
    if from_dir == "/"
      raise "no #{file} found in directory tree"
    end
puts "find_dir_containing(#{file}, #{from_dir})"    
    if Dir["#{from_dir}/#{file}"].empty?
      find_dir_containing(file, "#{from_dir}/..")
    else
      from_dir
    end
  end

  class Exception < ::Exception
  end
end
