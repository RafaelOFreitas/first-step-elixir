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

_user = insert(:user, id: "f4bafaa2-a878-430d-af4c-2d0c2e40d15d")

_item_1 = insert(:item, id: "6835cc18-3b52-411c-be3a-5453f046167c")
_item_2 = insert(:item, id: "da039f9d-3bc8-4b1d-bcd7-97d2d5f9c010")
_item_3 = insert(:item, id: "705f3f34-6fe7-4fd6-93b7-4ba55551a4a6")
_item_4 = insert(:item, id: "c0ddb640-31a9-4629-8f69-1341e0904848")
_item_5 = insert(:item, id: "7fed1169-3832-4fae-83f7-17edaee9e8d9")
