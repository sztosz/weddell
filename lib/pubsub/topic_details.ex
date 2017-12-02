defmodule Pubsub.TopicDetails do
  @moduledoc """
  A struct storing information about a topic
  """
  alias Google_Pubsub_V1.Topic

  @type t :: %__MODULE__{name: String.t, project: String.t}
  defstruct [:name, :project]

  def new(%Topic{name: topic}) do
    %{"project" => project, "name" => name} =
      ~r|projects/(?<project>[^/]*)/topics/(?<name>.*)|
      |> Regex.named_captures(topic)
    %__MODULE__{name: name, project: project}
  end
end