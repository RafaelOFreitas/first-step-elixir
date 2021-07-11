defmodule CrudApp.DB.CSV do
  alias Mix.Shell.IO, as: Shell
  alias CrudApp.CLI.Menu
  alias CrudApp.CLI.Friend
  alias NimbleCSV.RFC4180, as: CSV

  def perform(chosen_menu_item) do
    case chosen_menu_item do
      %Menu{id: :create, label: _} -> create()
      %Menu{id: :read, label: _} -> read()
      %Menu{id: :update, label: _} -> update()
      %Menu{id: :delete, label: _} -> delete()
    end

    CrudApp.CLI.Menu.Choice.start()
  end

  defp create do
    collect_data()
    |> transform_on_wrapped_list()
    |> prepare_list_to_save()
    |> save_csv_file([:append])
  end

  defp read do
    get_struct_list_from_csv()
    |> show_friends()
  end

  defp update do
    Shell.cmd("clear")

    prompt_message("Enter the email of the friend to be updated: ")
    |> search_friend_by_email()
    |> check_friend_found()
    |> confirm_action("Do you really want to update this friend from the list?")
    |> do_update()
  end

  defp delete do
    Shell.cmd("clear")

    prompt_message("Enter the email of the friend to be deleted: ")
    |> search_friend_by_email()
    |> check_friend_found()
    |> confirm_action("Do you really want to delete this friend from the list?")
    |> delete_and_save()
  end

  defp collect_data do
    Shell.cmd("clear")

    %Friend{
      name: prompt_message("Enter the name: "),
      email: prompt_message("Enter the email: "),
      phone: prompt_message("Enter the phone: ")
    }
  end

  defp transform_on_wrapped_list(struct) do
    struct
    |> Map.from_struct()
    |> Map.values()
    |> wrap_in_list()
  end

  defp wrap_in_list(struct) do
    [struct]
  end

  defp search_friend_by_email(email) do
    get_struct_list_from_csv()
    |> Enum.find(:not_found, fn list ->
      list.email == email
    end)
  end

  defp check_friend_found(friend) do
    case friend do
      :not_found ->
        Shell.cmd("clear")
        Shell.error("Friend not found... ")
        Shell.prompt("Press ENTER to continue")
        CrudApp.CLI.Menu.Choice.start()

      _ ->
        friend
    end
  end

  defp confirm_action(friend, message) do
    Shell.cmd("clear")
    Shell.info("We found...")

    show_friend(friend)

    case Shell.yes?(message) do
      true -> friend
      false -> :error
    end
  end

  defp do_update(friend) do
    Shell.cmd("clear")
    Shell.info("Now you will enter your friend's new data!...")

    update_friend = collect_data()

    get_struct_list_from_csv()
    |> delete_friend_from_friends_struct(friend)
    |> friend_list_to_csv()
    |> prepare_list_to_save()
    |> save_csv_file()

    update_friend
    |> transform_on_wrapped_list()
    |> prepare_list_to_save()
    |> save_csv_file([:append])

    Shell.info("Friend successfully updated!")
    Shell.prompt("Press ENTER to continue")
  end

  defp delete_and_save(friend) do
    case friend do
      :error ->
        Shell.info("Ok, the friend will not be deleted...")
        Shell.prompt("Press ENTER to continue")

      _ ->
        get_struct_list_from_csv()
        |> delete_friend_from_friends_struct(friend)
        |> friend_list_to_csv()
        |> prepare_list_to_save()
        |> save_csv_file()

        Shell.info("Friend successfully deleted!")
        Shell.prompt("Press ENTER to continue")
    end
  end

  defp get_struct_list_from_csv do
    read_csv_file()
    |> parse_csv_file_to_list()
    |> csv_list_to_struct_frieds()
  end

  defp read_csv_file do
    Application.fetch_env!(:crud_app, :csv_file_path)
    |> File.read!()
  end

  defp parse_csv_file_to_list(csv_file) do
    csv_file
    |> CSV.parse_string(headers: false)
  end

  defp csv_list_to_struct_frieds(friends) do
    friends
    |> Enum.map(fn [email, name, phone] ->
      %Friend{name: name, email: email, phone: phone}
    end)
  end

  defp prompt_message(message) do
    Shell.prompt(message)
    |> String.trim()
  end

  defp prepare_list_to_save(data) do
    data
    |> CSV.dump_to_iodata()
  end

  defp save_csv_file(data, mode \\ []) do
    Application.fetch_env!(:crud_app, :csv_file_path)
    |> File.write!(data, mode)
  end

  defp delete_friend_from_friends_struct(list, friend) do
    list
    |> Enum.reject(fn elem -> elem.email == friend.email end)
  end

  defp friend_list_to_csv(friends) do
    friends
    |> Enum.map(fn item -> [item.email, item.name, item.phone] end)
  end

  defp show_friends(friends) do
    friends
    |> Scribe.console(data: [{"Name", :name}, {"Email", :email}, {"Phone", :phone}])
  end

  defp show_friend(friend) do
    friend
    |> Scribe.print(data: [{"Name", :name}, {"Email", :email}, {"Phone", :phone}])
  end
end
