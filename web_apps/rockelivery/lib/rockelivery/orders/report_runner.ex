defmodule Rockelivery.Orders.ReportRunner do
  use GenServer

  require Logger

  alias Rockelivery.Orders.Report

  def start_link(initial_state \\ %{}) do
    GenServer.start_link(__MODULE__, initial_state)
  end

  @impl true
  def init(state) do
    Logger.info("Report Runner started")

    schedule_report_generation()

    {:ok, state}
  end

  @impl true
  def handle_info(:generate, state) do
    Logger.info("#{DateTime.utc_now()} generation report...")

    Report.create()

    schedule_report_generation()

    {:noreply, state}
  end

  def schedule_report_generation do
    Process.send_after(self(), :generate, 1000 * 60 * 60 * 6)
  end
end
