defmodule Mix.Tasks.Utils.FakeFriends do
  use Mix.Task
  alias NimbleCSV.RFC4180, as: CSV
  alias ContactBook.CLI.Friend

  @shortdoc "Add Fake Fiends APP"
  def run(_) do
    Faker.start()

    create_friends([], 50)
    |> CSV.dump_to_iodata()
    |> save_csv_file()

    IO.puts("Friends successfully registered!")
  end

  defp create_friends(list, count) when count <= 1 do
    list ++ [random_list_friend()]
  end

  defp create_friends(list, count) do
    list ++ [random_list_friend()] ++ create_friends(list, count - 1)
  end

  defp random_list_friend do
    %Friend{
      name: Faker.Person.PtBr.name(),
      email: Faker.Internet.email(),
      phone: Faker.Phone.EnUs.phone()
    }
    |> Map.from_struct()
    |> Map.values()
  end

  defp save_csv_file(data) do
    Application.fetch_env!(:contact_book, :csv_file_path)
    |> File.write!(data, [:append])
  end
end
