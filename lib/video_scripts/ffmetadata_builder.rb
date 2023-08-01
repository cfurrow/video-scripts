# frozen_string_literal: true

module VideoScripts
  class FfmetadataBuilder
    attr_reader :clips

    def initialize(clips, title = '')
      @clips = clips
      @output = <<~EOF
        ;FFMETADATA
        title=#{title}

      EOF
    end

    def build
      clips.each do |clip|
        # WARN: `clips` will contain clips that have a start, but no end time. (e.g. the last clip has no end time)
        @output << clip_line(clip)
      end
      @output
    end

    def clip_line(clip)
      return '' if clip.end_time.nil?

      <<~EOF
        [CHAPTER]
        TIMEBASE=1/1000
        START=#{clip.start_time_ms}
        END=#{clip.end_time_ms - 1}
        title=#{clip.description}
      EOF
    end
  end
end
