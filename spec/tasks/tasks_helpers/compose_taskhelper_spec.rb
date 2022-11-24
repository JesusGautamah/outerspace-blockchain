# frozen_string_literal: true

require "rails_helper"
require "/myapp/lib/tasks/task_helpers/compose_taskhelper"
require "/myapp/lib/tasks/task_helpers/taskhelper"

describe TaskHelpers::ComposeTaskhelper do
  describe "#compose_command" do
    it "returns docker-compose" do
      if ENV["ENV_MACHINE"] == "docker"
        expect { subject.compose_command }.to raise_error(TaskHelpers::Taskhelper::ComposeError)
      end
    end
  end
end
