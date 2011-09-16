# Rubyxr (Ruby eXtended Require)
version 0.1

Rubyxr provides a method for loading ruby files that takes into account relative paths from the current file location and relative paths from the project root. It ensures that files are loaded the same way regardless of the current directory. 

It works with Ruby 1.8, it does not work with Ruby 1.9.

## Usage

Use the method `requirex` instead of the standard `require`. 

    requirex './file_in_same_directory'
    requirex '../file_in_parent_directory'
    requirex './child_directory/file'

You can require relative to the project root by creating a file `.rubyxr` in the root directory and using `requirex` without a leading '.':

    requirex '/file_in_the_project_root'
    requirex '/project_root_child_dir/file'


## Rational

I tend towards breaking up my projects into modules in seperate subdirectories and work for periods in one of these subdirectories. But ruby makes it hard to do this without ugly File.path(...) statements in `require`s.

Ruby 1.9 require_relative obsoletes most of the functionality of Rubyxr although requiring relative to a project root could still be useful.
