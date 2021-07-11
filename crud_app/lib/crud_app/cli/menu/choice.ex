defmodule CrudApp.CLI.Menu.Choice do
  alias Mix.Shell.IO, as: Shell
  alias CrudApp.CLI.Menu.Items, as: Items
  alias CrudApp.DB.CSV, as: DB

  def start do
    Shell.cmd("clear")
    Shell.info("Choose an option: ")

    menu_items = Items.all()

    find_menu_item_by_index = &Enum.at(menu_items, &1, :error)

    menu_items
    |> Enum.map(& &1.label)
    |> display_options()
    |> generate_question()
    |> Shell.prompt()
    |> parse_answer()
    |> find_menu_item_by_index.()
    |> confirm_menu_item()
    |> confirm_message()
    |> DB.perform()
  end

  def display_options(options) do
    options
    |> Enum.with_index(1)
    |> Enum.each(fn {option, index} -> Shell.info("#{index} - #{option}") end)

    options
  end

  defp generate_question(options) do
    options = Enum.join(1..Enum.count(options), ",")
    "Which of the above options do you choose? [#{options}]\n"
  end

  defp parse_answer(answer) do
    case Integer.parse(answer) do
      :error -> invalid_option()
      {option, _} -> option - 1
    end
  end

  defp invalid_option() do
    Shell.cmd("clear")
    Shell.error("Invalid option")
    Shell.prompt("Press ENTER to try again!")
    start()
  end

  defp confirm_menu_item(chosen_menu_item) do
    case chosen_menu_item do
      :error -> invalid_option()
      _ -> chosen_menu_item
    end
  end

  defp confirm_message(chosen_menu_item) do
    Shell.cmd("clear")
    Shell.info("You chose... [#{chosen_menu_item.label}]")

    case Shell.yes?("Do you confirm?") do
      true -> chosen_menu_item
      false -> start()
    end
  end
end
