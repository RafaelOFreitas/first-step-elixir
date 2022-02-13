# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Rockelivery.Repo.insert!(%Rockelivery.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

import Rockelivery.Factory

Faker.start()

user = insert(:user, id: "ac5b97c8-f8b9-462f-8103-675b94caefe9")

item_1 = insert(:item, id: "6835cc18-3b52-411c-be3a-5453f046167c")
item_2 = insert(:item, id: "da039f9d-3bc8-4b1d-bcd7-97d2d5f9c010")
item_3 = insert(:item, id: "705f3f34-6fe7-4fd6-93b7-4ba55551a4a6")
item_4 = insert(:item, id: "c0ddb640-31a9-4629-8f69-1341e0904848")
item_5 = insert(:item, id: "7fed1169-3832-4fae-83f7-17edaee9e8d9")

items_1 = [item_1, item_2, item_3, item_4, item_5]

for _n <- 1..100 do
  user = insert(:user)
  insert(:order, items: items_1, user: user)
end

items_2 = insert_list(3, :item)

for _n <- 1..100 do
  user = insert(:user)
  insert(:order, items: items_2, user: user)
end
