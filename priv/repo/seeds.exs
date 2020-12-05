# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     BooksFauxLyfe.Repo.insert!(%BooksFauxLyfe.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias BooksFauxLyfe.Works

{:ok, _book1} =
  Works.create_book(%{
    date_published: ~D[2006-02-01],
    edition: "First Harper Perennial Modern Classics Edition",
    isbn: "9780060883287",
    title: "One Hundred Years of Solitude"
  })

{:ok, _book2} =
  Works.create_book(%{
    date_published: ~D[2005-08-02],
    edition: "40th Anniversary Edition",
    isbn: "9780441013593",
    title: "Dune"
  })
