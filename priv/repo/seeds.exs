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
alias BooksFauxLyfe.Repo
alias BooksFauxLyfe.Works.{Author, Work, WorkAuthor}

marquez =
  Repo.insert!(%Author{
    bio: "Magical Realist, Latin, Colombian, beautiful writer. So romantic.",
    date_death: ~D[2014-04-17],
    dob: ~D[1927-03-06],
    name: "Gabriel García Márquez"
  })

a_hundred_years =
  Repo.insert!(%Work{
    languages: ["es"],
    title: "Cien años de soledad"
  })

IO.inspect(a_hundred_years)
Repo.insert!(%WorkAuthor{id_work: a_hundred_years.id, id_author: marquez.id})

{:ok, _book1} =
  Works.create_book(%{
    id_work: a_hundred_years.id,
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
