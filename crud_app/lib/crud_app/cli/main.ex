defmodule CrudApp.CLI.Main do
  alias Mix.Shell.IO, as: Shell

  def start_app do
    Shell.cmd("clear")
    welcome_message()
    Shell.prompt("Press ENTER to boot...")
    start_menu_choice()
  end

  defp welcome_message do
    Shell.info("======================================")
    Shell.info("Welcome to your personal friends list!")
    Shell.info("======================================")
  end

  defp start_menu_choice do
    CrudApp.CLI.Menu.Choice.start()
  end
end
