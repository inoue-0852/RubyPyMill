# frozen_string_literal: true

require_relative "ruby_pymill/version"
require "json"
require "open3"

module RubyPyMill
  class Runner
    def initialize(kernel: "rpymill", cwd: nil, logger: $stdout)
      @kernel = kernel
      @cwd = cwd
      @logger = logger
    end

    # params_json: path to json file or JSON string
    def run(input_ipynb:, output_ipynb:, params_json: nil, kernel: nil, dry_run: false)
      k = kernel || @kernel
      args = ["papermill", input_ipynb, output_ipynb, "-k", k]
      if params_json
        if File.exist?(params_json)
          args += ["-f", params_json]
        else
          # treat as JSON literal string
          tmp = File.join(Dir.mktmpdir, "params.json")
          File.write(tmp, params_json)
          args += ["-f", tmp]
        end
      end
      cmd = args.join(" ")
      @logger.puts "[RubyPyMill] #{dry_run ? 'DRY' : 'RUN'}: #{cmd}"
      return true if dry_run

      stdout_str, stderr_str, status = Open3.capture3(cmd, chdir: @cwd || Dir.pwd)
      @logger.puts stdout_str unless stdout_str.empty?
      @logger.puts stderr_str unless stderr_str.empty?
      status.success?
    end
  end
end