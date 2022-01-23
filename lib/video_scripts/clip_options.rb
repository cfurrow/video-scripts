require 'optparse'

module VideoScripts
  class ClipOptionErrors
    def initialize
      @errors = {}
    end

    def add(field, message)
      @errors[field] ||= []
      @errors[field] << message
    end

    def any?
      !@errors.empty?
    end

    def to_s
      output = ""
      @errors.each do |field, messages|
        output << "Error in #{field}: #{messages.join(', ')}\n"
      end
      output
    end
  end

  class ClipOptions
    attr_accessor :input_file, :output_dir, :timestamp_file, :dry_run

    attr_accessor :errors

    def initialize
      @errors = ClipOptionErrors.new
    end

    def parse!
      OptionParser.new do |opts|
        opts.banner = "Usage: create-clips [options] <video_file> <output_dir>"
      
        opts.on("-h", "--help", "Display this help message.") do
          puts opts
          exit
        end
      
        opts.on("-fPATH", "--from_file=PATH", "Create clips from timestamps file") do |f|
          self.timestamp_file = f
        end
      
        opts.on("-d", "--dry_run", "Dry run, don't actually create clips") do
          self.dry_run = true
        end
      end.parse!
      
      self.input_file = ARGV[0]
      self.output_dir = ARGV[1]
      
      unless options.valid?
        puts options.errors
        exit 1
      end
    end

    def valid?
      errors.add(:input_file, "Input file is required.") if input_file.nil?
      errors.add(:output_dir, "Output file is required.") if output_dir.nil?
      errors.add(:input_file, "\"#{input_file}\" does not exist!") unless File.exist?(input_file || "")
      errors.add(:output_dir, "\"#{output_dir}\" does not exist!") unless Dir.exist?(output_dir || "")

      # TODO: If timestamp_file is not specified, try to use the input_file name with a "txt" extension, then check if it exists

      errors.add(:timestamp_file, "Timestamp file is required.") if timestamp_file.nil?
      errors.add(:timestamp_file, "#{timestamp_file} does not exist!") unless File.exist?(timestamp_file)
      
      !errors.any?
    end
  end
end