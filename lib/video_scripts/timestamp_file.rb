module VideoScripts
  class TimestampFile
    TIMESTAMP_LINE = /(?<time>(\d{1,2}:)?\d{2}:\d{2})\s+(?<description>.*?)$/

    attr_reader :clips, :path, :title

    def initialize(path)
      @path = path
      @clips = []
      @title = nil
    end

    def parse!
      @clips = []
      File.open(path, "r") do |file|
        file.each_line do |line|
          fetch_title(line) if file.lineno == 1
          @clips << create_clip_from_line(line)
        end
      end

      @clips.compact!

      # We need to populate the end_time of each clip to the start time of the next clip
      @clips.each_with_index do |clip, index|
        if index < @clips.length - 1
          clip.end_time = @clips[index + 1].start_time
        end
      end

      @clips
    end

    # Extract the title if it matches "title = <title>"
    def fetch_title(line)
      /^title\s*=\s*(.*)$/.match(line) do |match|
        @title = match[1]
      end
    end

    # Extract clip details from line if it matches "00:00:00 <description>"
    def create_clip_from_line(line)
      line_details = line.match(TIMESTAMP_LINE)

      return if line_details.nil?
      time = line_details[:time]
      description = line_details[:description]

      Clip.new(file=nil, start_time=time, end_time=nil, description)
    end
  end
end
