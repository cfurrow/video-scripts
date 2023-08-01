# frozen_string_literal: true

module VideoScripts
  class Clip
    TIME_PATTERN = /(?<hour>\d{1,2}):(?<minute>\d{2}):(?<second>\d{2})/
    attr_reader :file, :start_time, :end_time, :description
    attr_accessor :file, :end_time, :output_dir, :title

    def initialize(file, start_time, end_time, description)
      @file = file
      @start_time = start_time
      @end_time = end_time
      @title = nil
      # TODO: make this a cleanup method or service.
      @description = description&.tr('"', '')&.tr('/', '\/')&.tr('\\', '-')&.tr('\'', '')
      @output_dir = nil
    end

    def to_s
      "#{start_time} - #{end_time} #{description}"
    end

    def clip!
      puts "Clipping #{output_file}..."
      puts command
      system(command)
    end

    def command
      # This is complicated.
      # Using -codec copy seems to be fast, but some videos start with 3+seconds of black.
      # To fix that, the suggestion is to not use `-codec copy` but to simply re-encode every video.
      # Or, try to use `-codec copy` plus `-avoid_negative_ts make_zero` which may make the videos longer... but it also included waaaay more video when I tested it.
      "ffmpeg -i \"#{file}\" -ss #{start_time} #{end_time_option} -map_chapters -1 -avoid_negative_ts 1 -y \"#{output_file}\""
    end

    def start_time_ms
      time_to_ms(start_time)
    end

    def end_time_ms
      time_to_ms(end_time)
    end

    private

    def time_to_ms(time)
      match = TIME_PATTERN.match(time)
      return nil if match.nil?

      hour = match[:hour].to_i
      minute = match[:minute].to_i
      second = match[:second].to_i

      hour * 60 * 60 * 1000 + minute * 60 * 1000 + second * 1000
    end

    def input_filename
      File.basename(file, '.*')  # remove extension
    end

    def output_file
      @output_dir = "#{@output_dir}/" if @output_dir && !@output_dir.end_with?('/')
      preamble = title || input_filename
      "#{@output_dir}#{preamble} - #{description}.clip.mp4"
    end

    def end_time_option
      return '' if end_time.nil?

      "-to #{end_time}"
    end
  end
end
