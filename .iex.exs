import Ecto.Query
alias BooksFauxLyfe, as: BFL
alias BooksFauxLyfe.Works
alias BooksFauxLyfe.Works.{Author, Book, Work}
alias BooksFauxLyfe.Repo

# Retrieve a work by its title. Then return its author(s).
# Work |> Repo.get_by!(title: "Cien años de soledad") |> Repo.preload(:authors)
# Repo.one(
#   from work in Work,
#     preload: [:authors],
#     where: work.title == "Cien años de soledad"
# )
