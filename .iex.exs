alias BooksFauxLyfe, as: BFL
alias BooksFauxLyfe.Works
alias BooksFauxLyfe.Works.{Author, Book, Work}
alias BooksFauxLyfe.Repo

# Retrieve a work by its title. Then return its author(s).
Work |> Repo.preload(:authors) |> Repo.get_by!(title: "Cien años de soledad")
