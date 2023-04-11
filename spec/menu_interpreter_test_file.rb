class MenuInterpreter
  class BlankFilenameError < standardError; end

  def initialize(filename)
    raise BlankFilenameError, "Filename is required for this action" if filename.nil?
    puts "You called this file with the parameter #{ARGV[0]}"
    @filename = filename
  end

end
